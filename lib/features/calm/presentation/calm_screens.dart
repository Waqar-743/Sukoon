import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class CalmScreen extends ConsumerWidget {
  const CalmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Calm tools', 'Calm tools'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr(
              'Pick the quickest relief first',
              'Sab se tez relief pehle chuno',
            ),
            subtitle: store.tr(
              'Everything here works offline.',
              'Yahan sab kuch offline kaam karta hai.',
            ),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                QuickActionTile(
                  icon: Icons.air,
                  label: 'Box breathing',
                  onTap: () => context.push('/calm/breathing/box'),
                ),
                QuickActionTile(
                  icon: Icons.timer_outlined,
                  label: '4-7-8 breathing',
                  onTap: () => context.push('/calm/breathing/478'),
                ),
                QuickActionTile(
                  icon: Icons.self_improvement,
                  label: 'Grounding',
                  onTap: () => context.push('/calm/grounding'),
                ),
                QuickActionTile(
                  icon: Icons.favorite_border,
                  label: 'Affirmations',
                  onTap: () => context.push('/calm/affirmations'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Body scan', 'Body scan'),
            subtitle: store.tr(
              'Supportive, not intense.',
              'Supportive hai, intense nahin.',
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final step in AppContent.bodyScanSteps)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('• ${store.pick(step)}'),
                  ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () =>
                      context.push('/journal/editor/new?promptId=motivation'),
                  child: Text(
                    store.tr('Quick journal entry', 'Quick journal entry'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BreathingScreen extends ConsumerStatefulWidget {
  const BreathingScreen({super.key, required this.type});

  final String type;

  @override
  ConsumerState<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends ConsumerState<BreathingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  Timer? _timer;
  int _seconds = 0;
  int _cycles = 0;
  bool _running = false;

  int get _targetCycles => widget.type == '478' ? 4 : 5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _start() {
    final compositionMs = widget.type == '478' ? 19000 : 16000;
    _animationController.duration = Duration(milliseconds: compositionMs);
    _animationController.repeat();
    setState(() => _running = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        _seconds += 1;
        if (_seconds % (widget.type == '478' ? 19 : 16) == 0) {
          _cycles += 1;
        }
      });
      if (_cycles >= _targetCycles) {
        _timer?.cancel();
        _animationController.stop();
        setState(() => _running = false);
        await ref.read(sukoonStoreProvider).services.audio.playChime();
      }
    });
  }

  void _stop() {
    _timer?.cancel();
    _animationController.stop();
    setState(() => _running = false);
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    final is478 = widget.type == '478';
    final instructions = is478
        ? store.tr(
            'Inhale for 4, hold for 7, exhale for 8.',
            '4 tak saans lo, 7 tak rokho, 8 tak chhoro.',
          )
        : store.tr(
            'Inhale, hold, exhale, hold. Four counts each.',
            'Saans lo, roko, chhoro, roko. Har hissay ke 4 counts.',
          );

    return Scaffold(
      appBar: AppBar(title: Text(is478 ? '4-7-8 breathing' : 'Box breathing')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SukoonSectionCard(
              title: store.tr('Follow the rhythm', 'Rhythm follow karo'),
              subtitle: instructions,
              child: Column(
                children: [
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ScaleTransition(
                          scale: Tween<double>(begin: 0.8, end: 1.1).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                        Lottie.asset(
                          'assets/lottie/breathing_orb.json',
                          controller: _animationController,
                          onLoaded: (composition) {
                            _animationController.duration ??=
                                composition.duration;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${store.tr('Cycles', 'Cycles')}: $_cycles/$_targetCycles',
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: _running ? null : _start,
                        child: Text(store.tr('Start', 'Shuru')),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: _running ? _stop : null,
                        child: Text(store.tr('Pause', 'Pause')),
                      ),
                    ],
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

class GroundingScreen extends ConsumerWidget {
  const GroundingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Grounding', 'Grounding'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr('5-4-3-2-1', '5-4-3-2-1'),
            subtitle: store.tr(
              'Use your senses to come back to the room.',
              'Apni hissaasat se kamray mein wapas aao.',
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < AppContent.groundingSteps.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      '${i + 1}. ${store.pick(AppContent.groundingSteps[i])}',
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AffirmationsScreen extends ConsumerWidget {
  const AffirmationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Affirmations', 'Affirmations'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final affirmation in AppContent.affirmations)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SukoonSectionCard(
                title: store.tr('Keep this with you', 'Isay apne saath rakho'),
                trailing: IconButton(
                  onPressed: () => ref
                      .read(sukoonStoreProvider)
                      .toggleAffirmationFavorite(affirmation.id),
                  icon: Icon(
                    store.isFavoriteAffirmation(affirmation.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                ),
                child: Text(store.pick(affirmation.copy)),
              ),
            ),
        ],
      ),
    );
  }
}
