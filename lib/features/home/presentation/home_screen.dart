import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/core/theme/app_theme.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final tip =
        AppContent.dailyTips[DateTime.now().day % AppContent.dailyTips.length];
    final todayMood = store.todayMood;
    final habitCount = store.habits
        .where((habit) => store.isHabitDoneOn(habit, DateTime.now()))
        .length;
    final detoxMinutes = store.recentScrollAverage ?? 45;

    return SukoonContent(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.tr('Assalam-o-Alaikum', 'السلام علیکم'),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                            text: store.profile.firstName.isEmpty
                                ? store.tr('Friend', 'Dost')
                                : store.profile.firstName,
                          ),
                          TextSpan(
                            text: store.tr('  Good morning', '  Good morning'),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.spa_rounded, color: AppTheme.primary),
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (store.shouldShowEmergencyKit)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.errorLight,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: AppTheme.error.withValues(alpha: 0.18),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppTheme.error,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      store.tr(
                        'Feeling overwhelmed? You are not alone.',
                        'Agar bojh zyada lag raha hai to aap akelay nahin.',
                      ),
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: AppTheme.error),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/home/emergency-kit'),
                    child: Text(store.tr('Emergency kit', 'Emergency kit')),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr(
              'How are you feeling right now?',
              'Is waqt aap kaisa mehsoos kar rahe hain?',
            ),
            backgroundColor: AppTheme.primaryLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    final spacing = constraints.maxWidth > 360 ? 10.0 : 6.0;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        final score = index + 1;
                        final color = AppContent.moodColor(score);
                        final isActive = todayMood?.score == score;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: spacing / 2,
                            ),
                            child: InkWell(
                              onTap: () => context.go('/mood/checkin'),
                              borderRadius: BorderRadius.circular(999),
                              child: Container(
                                height: score == 4 ? 76 : 54,
                                decoration: BoxDecoration(
                                  color: color.withValues(
                                    alpha: isActive ? 1 : 0.18,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  score >= 4
                                      ? Icons.sentiment_satisfied_alt_rounded
                                      : score == 3
                                      ? Icons.sentiment_neutral_rounded
                                      : Icons.sentiment_dissatisfied_rounded,
                                  color: isActive ? Colors.white : color,
                                  size: score == 4 ? 42 : 28,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  todayMood == null
                      ? store.tr(
                          'No check-in yet. A quick note now can make the rest of the day clearer.',
                          'Abhi check-in nahin hua. Aik chhota note baqi din ko zyada saaf kar sakta hai.',
                        )
                      : store.tr(
                          'Today you logged ${todayMood.score}/5${todayMood.note.isNotEmpty ? ' — ${todayMood.note}' : ''}',
                          'Aaj aap ne ${todayMood.score}/5 log kiya${todayMood.note.isNotEmpty ? ' — ${todayMood.note}' : ''}',
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              MetricChip(
                label: store.tr('Streak', 'Streak'),
                value: '${store.moodStreak} days',
                icon: Icons.local_fire_department_rounded,
                color: AppTheme.surface,
              ),
              MetricChip(
                label: store.tr('Habits', 'Habits'),
                value: '$habitCount today',
                icon: Icons.check_circle_rounded,
                color: AppTheme.surface,
              ),
              MetricChip(
                label: store.tr('Detox', 'Detox'),
                value: '$detoxMinutes min',
                icon: Icons.timer_off_rounded,
                color: AppTheme.surface,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            store.tr('Quick tools', 'Quick tools'),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.sizeOf(context).width > 420 ? 4 : 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.95,
            children: [
              QuickActionTile(
                icon: Icons.air_rounded,
                label: store.tr('Breathe', 'Breathe'),
                onTap: () => context.push('/calm/breathing/box'),
                backgroundColor: AppTheme.secondaryLight,
                foregroundColor: AppTheme.secondary,
              ),
              QuickActionTile(
                icon: Icons.edit_note_rounded,
                label: store.tr('Journal', 'Journal'),
                onTap: () => context.go('/journal'),
              ),
              QuickActionTile(
                icon: Icons.timer_off_rounded,
                label: store.tr('Detox', 'Detox'),
                onTap: () => context.go('/detox'),
                backgroundColor: AppTheme.tertiaryLight,
                foregroundColor: AppTheme.tertiary,
              ),
              QuickActionTile(
                icon: Icons.favorite_outline_rounded,
                label: store.tr('Affirm', 'Affirm'),
                onTap: () => context.push('/calm/affirmations'),
                backgroundColor: AppTheme.surface,
                foregroundColor: AppTheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Today\'s thought', 'Aaj ka khayal'),
            child: Text(store.pick(tip)),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Your week', 'Aap ka hafta'),
            subtitle: DateFormat.yMMMMd().format(DateTime.now()),
            trailing: Text(
              store.tr('Trending upwards', 'Behtari ki taraf'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
            child: store.recentMoodEntries.isEmpty
                ? Text(store.tr('No entries yet', 'Abhi koi entry nahin'))
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
                              reservedSize: 20,
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
                            color: AppTheme.primary,
                            barWidth: 3,
                            belowBarData: BarAreaData(
                              show: true,
                              color: AppTheme.primaryLight,
                            ),
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
          if (store.shouldShowFomoReframe) ...[
            const SizedBox(height: 16),
            SukoonSectionCard(
              title: store.tr('FOMO reframe', 'FOMO reframe'),
              subtitle: store.tr(
                'Low mood and heavier scrolling showed up together today.',
                'Aaj low mood aur zyada scrolling aik saath nazar aaye.',
              ),
              trailing: TextButton(
                onPressed: () =>
                    context.push('/journal/editor/new?promptId=fomo'),
                child: Text(store.tr('Reflect', 'Reflect')),
              ),
              child: Text(store.correlationSummary),
            ),
          ],
        ],
      ),
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
