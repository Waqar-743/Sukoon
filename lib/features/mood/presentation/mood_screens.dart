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
      body: ListView(
        padding: const EdgeInsets.all(20),
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
                Slider(
                  value: _score.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: '$_score',
                  onChanged: (value) => setState(() => _score = value.round()),
                ),
                Center(
                  child: Text(
                    '$_score / 5',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppContent.moodColor(_score),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
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
                            if (selected && _selectedTags.length < 3) {
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
                      'Short note (optional)',
                      'Chhota note (optional)',
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: _scrollController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: store.tr(
                      'How many minutes did you scroll today? (optional)',
                      'Aaj kitne minute scroll kiya? (optional)',
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
                  child: Text(store.tr('Save check-in', 'Check-in save karo')),
                ),
              ],
            ),
          ),
        ],
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (store.moods.isEmpty)
            EmptyStateCard(
              title: store.tr('No mood history yet', 'Abhi mood history nahin'),
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
      body: ListView(
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
                                  color: Theme.of(context).colorScheme.primary,
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
                                  label: Text('${entry.key} · ${entry.value}'),
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
    );
  }
}
