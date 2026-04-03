import 'package:collection/collection.dart';
import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class DetoxDashboardScreen extends ConsumerWidget {
  const DetoxDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final baseline = store.baselineScrollMinutes;
    final recent = store.recentScrollAverage;
    final activeChallenge = store.detoxChallenges
        .where((item) => item.active)
        .firstOrNull;
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Detox', 'Detox')),
        actions: [
          TextButton(
            onPressed: () => context.push('/detox/stats'),
            child: Text(store.tr('Stats', 'Stats')),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr('Your attention today', 'Aaj tumhari tawajju'),
            subtitle: baseline == null
                ? store.tr(
                    'Usage analytics are in manual mode here.',
                    'Yahan usage analytics manual mode mein hain.',
                  )
                : store.tr(
                    'Compared with your personal baseline.',
                    'Tumhari apni baseline ke muqablay mein.',
                  ),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                MetricChip(
                  label: store.tr('Baseline', 'Baseline'),
                  value: baseline == null ? 'Manual' : '$baseline m',
                ),
                MetricChip(
                  label: store.tr('Recent', 'Recent'),
                  value: recent == null ? 'Manual' : '$recent m',
                ),
                MetricChip(
                  label: store.tr('Completed sessions', 'Completed sessions'),
                  value: '${store.completedDetoxSessions.length}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Start a session', 'Session shuru karo'),
            subtitle: store.tr(
              'Conscious choice over strict punishment.',
              'Sakht saza ke bajaye hoshmand intekhab.',
            ),
            child: Column(
              children: [
                for (final key in AppContent.sessionDurations.keys)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      tileColor: Colors.white,
                      title: Text(store.pick(AppContent.sessionTitles[key]!)),
                      subtitle: Text('${AppContent.sessionDurations[key]} min'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/detox/session/$key'),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Replacement idea', 'Replacement idea'),
            child: Text(
              store.pick(
                AppContent.replacementActivities[DateTime.now().second %
                    AppContent.replacementActivities.length],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Challenge', 'Challenge'),
            subtitle: activeChallenge == null
                ? store.tr(
                    'No challenge active.',
                    'Koi challenge active nahin.',
                  )
                : '${activeChallenge.name} · ${activeChallenge.completedDays}/${activeChallenge.totalDays}',
            trailing: FilledButton.tonal(
              onPressed: () => context.push('/detox/challenge'),
              child: Text(store.tr('Open', 'Kholo')),
            ),
            child: Text(
              store.tr(
                'Multi-day challenges help you rebuild attention gently.',
                'Multi-day challenges tumhari tawajju ko narmi se dobara bananay mein madad karte hain.',
              ),
            ),
          ),
          if (store.shouldShowFomoReframe) ...[
            const SizedBox(height: 16),
            SukoonSectionCard(
              title: store.tr('FOMO reframe journal', 'FOMO reframe journal'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(store.correlationSummary),
                  const SizedBox(height: 12),
                  FilledButton.tonal(
                    onPressed: () =>
                        context.push('/journal/editor/new?promptId=fomo'),
                    child: Text(store.tr('Open prompt', 'Prompt kholo')),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class DetoxSessionScreen extends ConsumerStatefulWidget {
  const DetoxSessionScreen({super.key, required this.type});

  final String type;

  @override
  ConsumerState<DetoxSessionScreen> createState() => _DetoxSessionScreenState();
}

class _DetoxSessionScreenState extends ConsumerState<DetoxSessionScreen> {
  Timer? _timer;
  int? _sessionId;
  late int _remainingSeconds;
  String _replacement = '';
  final TextEditingController _reflectionController = TextEditingController();
  bool _running = false;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = (AppContent.sessionDurations[widget.type] ?? 10) * 60;
    _replacement = AppContent.replacementActivities.first.en;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _reflectionController.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    final store = ref.read(sukoonStoreProvider);
    _sessionId ??= await store.startDetoxSession(
      type: widget.type,
      plannedMinutes: AppContent.sessionDurations[widget.type] ?? 10,
      replacementActivity: _replacement,
    );
    setState(() => _running = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        setState(() {
          _running = false;
          _completed = true;
        });
        return;
      }
      setState(() => _remainingSeconds -= 1);
    });
  }

  Future<void> _finish({required bool completed}) async {
    if (_sessionId == null) return;
    await ref
        .read(sukoonStoreProvider)
        .finishDetoxSession(
          id: _sessionId!,
          completed: completed,
          reflectionNote: _reflectionController.text,
        );
    if (!mounted) return;
    context.go('/detox');
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    final title = store.pick(AppContent.sessionTitles[widget.type]!);
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr('Choose your replacement', 'Replacement chuno'),
            subtitle: store.tr(
              'What will your attention move toward instead?',
              'Tumhari tawajju ab kis taraf jayegi?',
            ),
            child: DropdownButtonFormField<String>(
              initialValue: _replacement,
              items: AppContent.replacementActivities
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.en,
                      child: Text(store.pick(item)),
                    ),
                  )
                  .toList(),
              onChanged: (value) =>
                  setState(() => _replacement = value ?? _replacement),
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Time remaining', 'Baqi waqt'),
            child: Column(
              children: [
                Text(
                  '$minutes:$seconds',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                if (!_running && !_completed)
                  FilledButton(
                    onPressed: _start,
                    child: Text(
                      store.tr('Start session', 'Session shuru karo'),
                    ),
                  )
                else if (_running)
                  OutlinedButton(
                    onPressed: () => _finish(completed: false),
                    child: Text(store.tr('End early', 'Jaldi khatam karo')),
                  )
                else
                  FilledButton(
                    onPressed: () => _finish(completed: true),
                    child: Text(
                      store.tr('Complete session', 'Session mukammal karo'),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Reflection', 'Reflection'),
            child: TextField(
              controller: _reflectionController,
              minLines: 4,
              maxLines: null,
              decoration: InputDecoration(
                labelText: store.tr(
                  'What did the pause make possible?',
                  'Is waqfay ne kya mumkin banaya?',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetoxChallengeScreen extends ConsumerWidget {
  const DetoxChallengeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final active = store.detoxChallenges
        .where((item) => item.active)
        .firstOrNull;
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Detox challenge', 'Detox challenge')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (active != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SukoonSectionCard(
                title: active.name,
                subtitle: '${active.completedDays}/${active.totalDays}',
                child: LinearProgressIndicator(
                  value: active.completedDays / active.totalDays,
                ),
              ),
            ),
          for (final challenge in AppContent.detoxChallenges)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SukoonSectionCard(
                title: store.pick(challenge.title),
                subtitle: store.pick(challenge.summary),
                trailing: FilledButton.tonal(
                  onPressed: () => ref
                      .read(sukoonStoreProvider)
                      .activateChallenge(challenge),
                  child: Text(store.tr('Start', 'Shuru')),
                ),
                child: Text('${challenge.days} ${store.tr('days', 'days')}'),
              ),
            ),
        ],
      ),
    );
  }
}

class DetoxStatsScreen extends ConsumerWidget {
  const DetoxStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    final sessions = store.completedDetoxSessions;
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Detox stats', 'Detox stats'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr('Your pattern', 'Tumhara pattern'),
            subtitle: store.tr('Insight, not guilt.', 'Insight, guilt nahin.'),
            child: sessions.isEmpty
                ? Text(
                    store.tr(
                      'Complete a few sessions to see trends here.',
                      'Kuch sessions mukammal karo, phir trends yahan nazar aayenge.',
                    ),
                  )
                : SizedBox(
                    height: 180,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        titlesData: const FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        barGroups: [
                          for (var i = 0; i < sessions.take(5).length; i++)
                            BarChartGroupData(
                              x: i,
                              barRods: [
                                BarChartRodData(
                                  toY: sessions[i].plannedMinutes.toDouble(),
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(6),
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
            title: store.tr('Compassionate note', 'Narm note'),
            child: Text(store.correlationSummary),
          ),
        ],
      ),
    );
  }
}
