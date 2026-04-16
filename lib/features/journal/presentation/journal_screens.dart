import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/core/theme/app_theme.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class JournalHomeScreen extends ConsumerStatefulWidget {
  const JournalHomeScreen({super.key});

  @override
  ConsumerState<JournalHomeScreen> createState() => _JournalHomeScreenState();
}

class _JournalHomeScreenState extends ConsumerState<JournalHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    final entries = store.journalEntries.where((entry) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return entry.title.toLowerCase().contains(q) ||
          entry.body.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Journal', 'Journal')),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await ref
              .read(sukoonStoreProvider)
              .guardedPush(context, '/journal/editor/new');
        },
        icon: const Icon(Icons.edit_note),
        label: Text(store.tr('Write', 'Likho')),
      ),
      body: SukoonContent(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
          children: [
            SukoonSectionCard(
              title: store.tr('Private by design', 'Bunyadi tor par private'),
              subtitle: store.tr(
                'Entries stay on your device. Biometrics are optional.',
                'Entries tumhare device par rehti hain. Biometrics optional hain.',
              ),
              backgroundColor: AppTheme.primaryLight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline_rounded,
                          color: AppTheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            store.pick(AppContent.prompts.first.title),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      labelText: store.tr(
                        'Search entries',
                        'Entries search karo',
                      ),
                    ),
                    onChanged: (value) => setState(() => _query = value.trim()),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: AppContent.prompts.take(4).map((prompt) {
                      return ActionChip(
                        label: Text(store.pick(prompt.title)),
                        onPressed: () async {
                          await ref
                              .read(sukoonStoreProvider)
                              .guardedPush(
                                context,
                                '/journal/editor/new?promptId=${prompt.id}',
                              );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (entries.isEmpty)
              EmptyStateCard(
                title: store.tr('No entries yet', 'Abhi entries nahin'),
                message: store.tr(
                  'Start with a free write or use a prompt about exams, comparison, or self-worth.',
                  'Free write se shuru karo ya exams, muqable, ya self-worth wala prompt use karo.',
                ),
              )
            else
              for (final entry in entries)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SukoonSectionCard(
                    title: entry.title.isEmpty
                        ? store.tr(
                            'Untitled reflection',
                            'Bila unwan reflection',
                          )
                        : entry.title,
                    subtitle:
                        '${DateFormat.yMMMd().add_jm().format(entry.updatedAt)} · ${entry.promptCategory ?? store.tr('Free write', 'Free write')}',
                    trailing: const Icon(Icons.chevron_right_rounded),
                    child: InkWell(
                      onTap: () async {
                        await ref
                            .read(sukoonStoreProvider)
                            .guardedPush(context, '/journal/entry/${entry.id}');
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          entry.body.isEmpty
                              ? store.tr(
                                  'Tap to open this reflection.',
                                  'Is reflection ko kholne ke liye tap karein.',
                                )
                              : entry.body,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class JournalEditorScreen extends ConsumerStatefulWidget {
  const JournalEditorScreen({super.key, this.entryId, this.promptId});

  final int? entryId;
  final String? promptId;

  @override
  ConsumerState<JournalEditorScreen> createState() =>
      _JournalEditorScreenState();
}

class _JournalEditorScreenState extends ConsumerState<JournalEditorScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Timer? _debounce;
  int? _savedId;
  String? _promptId;
  int? _linkedMoodId;

  @override
  void initState() {
    super.initState();
    final store = ref.read(sukoonStoreProvider);
    final existing = widget.entryId == null
        ? null
        : store.journalEntries.firstWhereOrNull(
            (item) => item.id == widget.entryId,
          );
    _savedId = existing?.id;
    _promptId = widget.promptId ?? existing?.promptId;
    _linkedMoodId = existing?.moodEntryId;
    _titleController.text = existing?.title ?? '';
    _bodyController.text = existing?.body ?? '';
    _titleController.addListener(_scheduleSave);
    _bodyController.addListener(_scheduleSave);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  ReflectionPrompt? get _prompt => AppContent.promptById(_promptId);

  Future<void> _scheduleSave() async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 700), _persist);
  }

  Future<void> _persist() async {
    if (_titleController.text.trim().isEmpty &&
        _bodyController.text.trim().isEmpty) {
      return;
    }
    final store = ref.read(sukoonStoreProvider);
    _savedId = await store.saveJournalEntry(
      id: _savedId,
      title: _titleController.text,
      body: _bodyController.text,
      promptId: _prompt?.id,
      promptCategory: _prompt?.category,
      moodEntryId: _linkedMoodId,
      locked: store.biometricEnabled,
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _persist(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(store.tr('Journal editor', 'Journal editor')),
          actions: [
            TextButton(
              onPressed: () async {
                await _persist();
                if (!context.mounted) return;
                context.pop();
              },
              child: Text(store.tr('Done', 'Done')),
            ),
          ],
        ),
        body: SukoonContent(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              if (_prompt != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SukoonSectionCard(
                    title: store.pick(_prompt!.title),
                    subtitle: _prompt!.category,
                    child: Text(store.pick(_prompt!.prompt)),
                  ),
                ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: store.tr('Title', 'Title'),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int?>(
                initialValue: _linkedMoodId,
                decoration: InputDecoration(
                  labelText: store.tr(
                    'Link mood (optional)',
                    'Link mood (optional)',
                  ),
                ),
                items: [
                  DropdownMenuItem<int?>(
                    value: null,
                    child: Text(store.tr('None', 'None')),
                  ),
                  ...store.moods
                      .take(5)
                      .map(
                        (mood) => DropdownMenuItem<int?>(
                          value: mood.id,
                          child: Text(
                            '${DateFormat.MMMd().add_jm().format(mood.createdAt)} · ${mood.score}/5',
                          ),
                        ),
                      ),
                ],
                onChanged: (value) => setState(() => _linkedMoodId = value),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _bodyController,
                minLines: 10,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: store.tr('Write freely', 'Azadana likho'),
                  helperText: store.tr(
                    'Autosaves on device as you type.',
                    'Jab tum likhte ho to device par autosave hota rehta hai.',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JournalEntryScreen extends ConsumerWidget {
  const JournalEntryScreen({super.key, required this.entryId});

  final int entryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final entry = store.journalEntries.firstWhereOrNull(
      (item) => item.id == entryId,
    );
    if (entry == null) {
      return Scaffold(
        appBar: AppBar(title: Text(store.tr('Journal entry', 'Journal entry'))),
        body: SukoonContent(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              EmptyStateCard(
                title: store.tr('Entry not found', 'Entry not found'),
                message: store.tr(
                  'This reflection is no longer available. Try opening another entry from your journal list.',
                  'Yeh reflection ab dastiyab nahin. Journal list se koi dusri entry kholen.',
                ),
                action: FilledButton.tonal(
                  onPressed: () => context.go('/journal'),
                  child: Text(store.tr('Back to journal', 'Back to journal')),
                ),
              ),
            ],
          ),
        ),
      );
    }
    final linkedMood = store.moodById(entry.moodEntryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Journal entry', 'Journal entry')),
        actions: [
          IconButton(
            onPressed: () => context.push('/journal/editor/${entry.id}'),
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () async {
              await ref.read(sukoonStoreProvider).deleteJournalEntry(entry.id);
              if (context.mounted) context.pop();
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: SukoonContent(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SukoonSectionCard(
              title: entry.title.isEmpty
                  ? store.tr('Untitled reflection', 'Bila unwan reflection')
                  : entry.title,
              subtitle: DateFormat.yMMMMd().add_jm().format(entry.updatedAt),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (entry.promptCategory != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Chip(label: Text(entry.promptCategory!)),
                    ),
                  if (linkedMood != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        '${store.tr('Linked mood', 'Linked mood')}: ${linkedMood.score}/5',
                      ),
                    ),
                  Text(entry.body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
