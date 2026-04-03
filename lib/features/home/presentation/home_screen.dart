import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final tip =
        AppContent.dailyTips[DateTime.now().day % AppContent.dailyTips.length];
    final todayMood = store.todayMood;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SukoonSectionCard(
          title: store.tr(
            'Assalam o Alaikum, ${store.profile.firstName.isEmpty ? 'friend' : store.profile.firstName}.',
            'Assalam o Alaikum, ${store.profile.firstName.isEmpty ? 'dost' : store.profile.firstName}.',
          ),
          subtitle: store.tr(
            'You do not have to fix everything today. Start by noticing where you are.',
            'Aaj tumhein sab kuch theek karna zaroori nahin. Bas yeh notice karo ke tum kahan ho.',
          ),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              MetricChip(
                label: store.tr('Mood streak', 'Mood streak'),
                value: '${store.moodStreak} d',
              ),
              MetricChip(
                label: store.tr('Journal streak', 'Journal streak'),
                value: '${store.journalStreak} d',
              ),
              MetricChip(
                label: store.tr('Points', 'Points'),
                value: '${store.totalPoints}',
              ),
            ],
          ),
        ),
        if (store.shouldShowEmergencyKit) ...[
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr(
              'You seem overloaded today.',
              'Aaj tum kuch zyada bojh mehsoos kar rahe ho.',
            ),
            subtitle: store.tr(
              'Take the fastest path to relief. No pressure. Just support.',
              'Sukoon ki taraf sab se tez rasta lo. Koi pressure nahin. Sirf support.',
            ),
            trailing: FilledButton.tonal(
              onPressed: () => context.push('/home/emergency-kit'),
              child: Text(store.tr('Open', 'Kholo')),
            ),
            child: Text(
              store.tr(
                'Breathing, grounding, and affirmations are one tap away.',
                'Breathing, grounding aur affirmations aik tap par hain.',
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        SukoonSectionCard(
          title: store.tr('Today\'s mood', 'Aaj ka mood'),
          trailing: FilledButton.tonal(
            onPressed: () => context.go('/mood/checkin'),
            child: Text(
              todayMood == null
                  ? store.tr('Check in', 'Check in')
                  : store.tr('Update', 'Update'),
            ),
          ),
          child: todayMood == null
              ? Text(
                  store.tr(
                    'No check-in yet. A quick note now can make the rest of the day clearer.',
                    'Abhi check-in nahin hua. Aik chhota note baqi din ko zyada saaf kar sakta hai.',
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.tr(
                        'Score ${todayMood.score}/5',
                        'Score ${todayMood.score}/5',
                      ),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: AppContent.moodColor(todayMood.score),
                          ),
                    ),
                    const SizedBox(height: 8),
                    if (todayMood.emotionTags.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: todayMood.emotionTags
                            .map(
                              (tag) => Chip(
                                label: Text(tag),
                                visualDensity: VisualDensity.compact,
                              ),
                            )
                            .toList(),
                      ),
                    if (todayMood.note.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(todayMood.note),
                    ],
                  ],
                ),
        ),
        const SizedBox(height: 16),
        SukoonSectionCard(
          title: store.tr('Quick actions', 'Quick actions'),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.25,
            children: [
              QuickActionTile(
                icon: Icons.air,
                label: store.tr('Breathing', 'Breathing'),
                onTap: () => context.push('/calm/breathing/box'),
              ),
              QuickActionTile(
                icon: Icons.auto_stories_outlined,
                label: store.tr('Journal', 'Journal'),
                onTap: () => context.go('/journal'),
              ),
              QuickActionTile(
                icon: Icons.timer,
                label: store.tr('Detox', 'Detox'),
                onTap: () => context.go('/detox'),
              ),
              QuickActionTile(
                icon: Icons.favorite_outline,
                label: store.tr('Affirmations', 'Affirmations'),
                onTap: () => context.push('/calm/affirmations'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SukoonSectionCard(
          title: store.tr('Weekly mood snapshot', 'Haftay ka mood snapshot'),
          subtitle: store.tr(
            'A simple view, not a judgment.',
            'Yeh bas aik saadah nazar hai, faisla nahin.',
          ),
          child: store.recentMoodEntries.isEmpty
              ? const SizedBox(
                  height: 140,
                  child: Center(child: Text('No entries yet')),
                )
              : SizedBox(
                  height: 180,
                  child: LineChart(
                    LineChartData(
                      minY: 1,
                      maxY: 5,
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            reservedSize: 24,
                            getTitlesWidget: (value, meta) =>
                                Text(value.toInt().toString()),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index < 0 ||
                                  index >= store.recentMoodEntries.length) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  DateFormat.E().format(
                                    store.recentMoodEntries[index].createdAt,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          color: Theme.of(context).colorScheme.primary,
                          barWidth: 3,
                          dotData: const FlDotData(show: true),
                          spots: [
                            for (
                              var i = 0;
                              i < store.recentMoodEntries.length;
                              i++
                            )
                              FlSpot(
                                i.toDouble(),
                                store.recentMoodEntries[i].score.toDouble(),
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
          title: store.tr('Daily tip', 'Aaj ka tip'),
          subtitle: DateFormat.yMMMMd().format(DateTime.now()),
          child: Text(store.pick(tip)),
        ),
        if (store.shouldShowFomoReframe) ...[
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('FOMO reframe', 'FOMO reframe'),
            subtitle: store.tr(
              'Low mood and heavier scrolling showed up together today.',
              'Aaj low mood aur zyada scrolling aik saath nazar aaye.',
            ),
            trailing: FilledButton.tonal(
              onPressed: () =>
                  context.push('/journal/editor/new?promptId=fomo'),
              child: Text(store.tr('Reflect', 'Reflect')),
            ),
            child: Text(store.correlationSummary),
          ),
        ],
      ],
    );
  }
}

class EmergencyKitScreen extends ConsumerWidget {
  const EmergencyKitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Emergency kit', 'Emergency kit'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr(
              'First, slow the moment down.',
              'Pehle is lamhay ko dheema karo.',
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () => context.push('/calm/breathing/box'),
                  icon: const Icon(Icons.air),
                  label: Text(
                    store.tr('Start box breathing', 'Box breathing shuru karo'),
                  ),
                ),
                const SizedBox(height: 10),
                FilledButton.tonalIcon(
                  onPressed: () => context.push('/calm/grounding'),
                  icon: const Icon(Icons.self_improvement_outlined),
                  label: Text(store.tr('Do grounding', 'Grounding karo')),
                ),
                const SizedBox(height: 10),
                FilledButton.tonalIcon(
                  onPressed: () => context.push('/calm/affirmations'),
                  icon: const Icon(Icons.favorite_outline),
                  label: Text(
                    store.tr('Read affirmations', 'Affirmations parho'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr(
              'If this feels bigger than the app',
              'Agar yeh app se bari cheez lag rahi hai',
            ),
            child: Text(store.pick(AppContent.emergencyContacts)),
          ),
        ],
      ),
    );
  }
}
