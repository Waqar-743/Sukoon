import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/core/theme/app_theme.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class MoodCheckinScreen extends ConsumerStatefulWidget {
  const MoodCheckinScreen({super.key});

  @override
  ConsumerState<MoodCheckinScreen> createState() => _MoodCheckinScreenState();
}

class _MoodCheckinScreenState extends ConsumerState<MoodCheckinScreen> {
  int _score = 3;
  final Set<String> _selectedTags = <String>{};
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _scrollController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    final moods = <({int score, String label, IconData icon, Color color})>[
      (
        score: 1,
        label: 'Very bad',
        icon: Icons.sentiment_very_dissatisfied_rounded,
        color: AppContent.moodColor(1),
      ),
      (
        score: 2,
        label: 'Bad',
        icon: Icons.sentiment_dissatisfied_rounded,
        color: AppContent.moodColor(2),
      ),
      (
        score: 3,
        label: 'Okay',
        icon: Icons.sentiment_neutral_rounded,
        color: AppContent.moodColor(3),
      ),
      (
        score: 4,
        label: 'Good',
        icon: Icons.sentiment_satisfied_alt_rounded,
        color: AppContent.moodColor(4),
      ),
      (
        score: 5,
        label: 'Great',
        icon: Icons.mood_rounded,
        color: AppContent.moodColor(5),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Mood check-in', 'Mood check-in')),
        actions: [
          TextButton(
            onPressed: () => context.push('/mood/history'),
            child: Text(store.tr('History', 'History')),
          ),
          TextButton(
            onPressed: () => context.push('/mood/insights'),
            child: Text(store.tr('Insights', 'Insights')),
          ),
        ],
      ),
      body: SukoonContent(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
          children: [
            SukoonSectionCard(
              title: store.tr(
                'How are you feeling right now?',
                'Is waqt tum kaisa mehsoos kar rahe ho?',
              ),
              subtitle: store.tr(
                'Keep it honest, not perfect.',
                'Isay perfect nahin, sachcha rakho.',
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 10,
                    runSpacing: 14,
                    children: moods.map((mood) {
                      final isSelected = _score == mood.score;
                      final size = mood.score == 4 ? 82.0 : 60.0;
                      return GestureDetector(
                        onTap: () => setState(() => _score = mood.score),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            color: mood.color.withValues(
                              alpha: isSelected ? 1 : 0.18,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: mood.color.withValues(alpha: 0.25),
                                      blurRadius: 18,
                                      offset: const Offset(0, 8),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Icon(
                            mood.icon,
                            color: isSelected ? Colors.white : mood.color,
                            size: mood.score == 4 ? 40 : 28,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: Text(
                      '${store.tr('Mood score', 'Mood score')} $_score / 5',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppContent.moodColor(_score),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    store.tr('Selected tags', 'Selected tags'),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _selectedTags.isEmpty
                          ? [
                              Text(
                                store.tr(
                                  'Select up to 5 tags below.',
                                  'Neeche se zyada se zyada 5 tags chunen.',
                                ),
                              ),
                            ]
                          : _selectedTags
                                .map(
                                  (tag) => Chip(
                                    label: Text(tag),
                                    deleteIcon: const Icon(
                                      Icons.close,
                                      size: 16,
                                    ),
                                    onDeleted: () => setState(
                                      () => _selectedTags.remove(tag),
                                    ),
                                  ),
                                )
                                .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final tag in AppContent.emotionTags)
                        FilterChip(
                          selected: _selectedTags.contains(tag),
                          label: Text(tag),
                          onSelected: (selected) {
                            setState(() {
                              if (selected && _selectedTags.length < 5) {
                                _selectedTags.add(tag);
                              } else if (!selected) {
                                _selectedTags.remove(tag);
                              }
                            });
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: _noteController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: store.tr(
                        'Anything else?',
                        'Kya aur bhi kuch kehna hai?',
                      ),
                      hintText: store.tr(
                        'Write your thoughts...',
                        'Apne khayalat likhein...',
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: _scrollController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: store.tr(
                        'How many minutes did you scroll today?',
                        'Aaj kitne minutes scroll kiya?',
                      ),
                      helperText: store.tr(
                        'Manual fallback for usage insights.',
                        'Usage insights ke liye manual fallback.',
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  FilledButton(
                    onPressed: () async {
                      await ref
                          .read(sukoonStoreProvider)
                          .addMoodEntry(
                            score: _score,
                            emotionTags: _selectedTags.toList(),
                            note: _noteController.text,
                            manualScrollMinutes: int.tryParse(
                              _scrollController.text.trim(),
                            ),
                          );
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            store.tr(
                              'Mood saved locally.',
                              'Mood local tor par save ho gaya.',
                            ),
                          ),
                        ),
                      );
                      context.go('/home');
                    },
                    child: Text(store.tr('Log my mood', 'Mood save karein')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodHistoryScreen extends ConsumerWidget {
  const MoodHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Mood history', 'Mood history'))),
      body: SukoonContent(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            if (store.moods.isEmpty)
              EmptyStateCard(
                title: store.tr(
                  'No mood history yet',
                  'Abhi mood history nahin',
                ),
                message: store.tr(
                  'A few honest check-ins will make your patterns visible here.',
                  'Kuch sachche check-ins ke baad yahan patterns nazar aayenge.',
                ),
              )
            else
              for (final entry in store.moods)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SukoonSectionCard(
                    title:
                        '${DateFormat.yMMMd().add_jm().format(entry.createdAt)} · ${entry.score}/5',
                    subtitle: entry.emotionTags.join(', '),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (entry.note.isNotEmpty) Text(entry.note),
                        if (entry.manualScrollMinutes != null) ...[
                          const SizedBox(height: 10),
                          Text(
                            '${store.tr('Scroll estimate', 'Scroll estimate')}: ${entry.manualScrollMinutes} ${store.tr('minutes', 'minutes')}',
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class MoodInsightsScreen extends ConsumerStatefulWidget {
  const MoodInsightsScreen({super.key});

  @override
  ConsumerState<MoodInsightsScreen> createState() => _MoodInsightsScreenState();
}

class _MoodInsightsScreenState extends ConsumerState<MoodInsightsScreen> {
  final ScreenshotController _controller = ScreenshotController();

  Future<void> _shareSnapshot(SukoonStore store) async {
    final bytes = await _controller.capture(pixelRatio: 2.0);
    if (bytes == null) return;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/sukoon_mood_snapshot.png');
    await file.writeAsBytes(bytes);
    await SharePlus.instance.share(
      ShareParams(text: 'Sukoon mood snapshot', files: [XFile(file.path)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Mood insights', 'Mood insights')),
        actions: [
          IconButton(
            onPressed: store.moods.isEmpty ? null : () => _shareSnapshot(store),
            icon: const Icon(Icons.ios_share),
          ),
        ],
      ),
      body: SukoonContent(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Screenshot(
              controller: _controller,
              child: Column(
                children: [
                  SukoonSectionCard(
                    title: store.tr(
                      'What the week shows',
                      'Hafta kya dikha raha hai',
                    ),
                    subtitle: store.correlationSummary,
                    child: store.recentMoodEntries.isEmpty
                        ? SizedBox(
                            height: 140,
                            child: Center(
                              child: Text(
                                store.tr(
                                  'Add a few check-ins first.',
                                  'Pehle kuch check-ins add karo.',
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 200,
                            child: LineChart(
                              LineChartData(
                                minY: 1,
                                maxY: 5,
                                borderData: FlBorderData(show: false),
                                gridData: const FlGridData(show: false),
                                titlesData: const FlTitlesData(
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    isCurved: true,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    spots: [
                                      for (
                                        var i = 0;
                                        i < store.recentMoodEntries.length;
                                        i++
                                      )
                                        FlSpot(
                                          i.toDouble(),
                                          store.recentMoodEntries[i].score
                                              .toDouble(),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                  SukoonSectionCard(
                    title: store.tr('Top emotions', 'Top emotions'),
                    child: store.emotionCounts.isEmpty
                        ? Text(
                            store.tr(
                              'Emotion patterns will appear here after a few entries.',
                              'Kuch entries ke baad emotion patterns yahan nazar aayenge.',
                            ),
                          )
                        : Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: store.emotionCounts.entries
                                .map(
                                  (entry) => Chip(
                                    label: Text(
                                      '${entry.key} · ${entry.value}',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                  const SizedBox(height: 16),
                  SukoonSectionCard(
                    title: store.tr(
                      'Compassionate interpretation',
                      'Narm interpretation',
                    ),
                    child: Text(store.correlationSummary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
