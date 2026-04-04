import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/core/theme/app_theme.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final SukoonStore _store;
  Timer? _navigationDelay;
  Timer? _navigationWatchdog;
  bool _didNavigate = false;

  @override
  void initState() {
    super.initState();
    _store = ref.read(sukoonStoreProvider);
    _store.addListener(_tryNavigateFromSplash);
    _navigationDelay = Timer(
      const Duration(milliseconds: 900),
      _tryNavigateFromSplash,
    );
    _navigationWatchdog = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _tryNavigateFromSplash(),
    );
  }

  @override
  void dispose() {
    _navigationDelay?.cancel();
    _navigationWatchdog?.cancel();
    _store.removeListener(_tryNavigateFromSplash);
    super.dispose();
  }

  void _tryNavigateFromSplash() {
    if (!mounted || _didNavigate || !_store.isReady) return;
    _didNavigate = true;
    _navigationDelay?.cancel();
    _navigationWatchdog?.cancel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.go(_store.onboardingComplete ? '/home' : '/start');
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: AppTheme.surface),
        child: Stack(
          children: [
            SafeArea(
              child: SukoonContent(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          'APP-ICON.png',
                          fit: BoxFit.contain,
                          height: 280,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Sukoon',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'سکون',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        store.tr(
                          'Your mind deserves peace.',
                          'Tumhara zehen sukoon ka mustahiq hai.',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      const SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      ),
                    ],
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

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: AppTheme.surface),
        child: Stack(
          children: [
            Positioned(
              top: -120,
              right: -110,
              child: _softBlob(AppTheme.primaryLight, 320),
            ),
            Positioned(
              left: -120,
              bottom: -120,
              child: _softBlob(AppTheme.secondaryLight, 280),
            ),
            SafeArea(
              child: SukoonContent(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                  child: Column(
                    children: [
                      const Spacer(),
                      Flexible(
                        flex: 3,
                        child: Image.asset(
                          'Icon.png',
                          fit: BoxFit.contain,
                          height: 320,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        store.tr(
                          'Find your inner peace',
                          'Apna andarooni sukoon pao',
                        ),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        store.tr(
                          'A safe space for students to manage stress, track habits, and build resilience.',
                          'Talaba ke liye aik mehfooz jagah jahan stress ko samjha ja sake aur behtar aadatein ban sakein.',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () => context.go('/onboarding/profile'),
                        child: Text(store.tr('Get started', 'Shuru karein')),
                      ),
                    ],
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

class ProfileOnboardingScreen extends ConsumerStatefulWidget {
  const ProfileOnboardingScreen({super.key});

  @override
  ConsumerState<ProfileOnboardingScreen> createState() =>
      _ProfileOnboardingScreenState();
}

class _ProfileOnboardingScreenState
    extends ConsumerState<ProfileOnboardingScreen> {
  late final TextEditingController _nameController;
  String? _educationLevel;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(sukoonStoreProvider).profile;
    _nameController = TextEditingController(text: profile.firstName);
    _educationLevel = profile.educationLevel.isEmpty
        ? null
        : profile.educationLevel;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return _OnboardingScaffold(
      step: 1,
      title: store.tr('What should we call you?', 'Hum aap ko kya pukarein?'),
      subtitle: store.tr(
        'We will never share your name with anyone.',
        'Hum aap ka naam kisi ke saath share nahin karein ge.',
      ),
      hero: _OnboardingHero(
        background: AppTheme.primaryLight,
        child: Image.asset('Icon.png', fit: BoxFit.contain),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: store.tr('First name', 'Pehla naam'),
              hintText: store.tr('Your first name', 'Apna pehla naam'),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: _educationLevel,
            items: [
              for (final item in AppContent.educationLevels)
                DropdownMenuItem(value: item, child: Text(item)),
            ],
            onChanged: (value) => setState(() => _educationLevel = value),
            decoration: InputDecoration(
              labelText: store.tr('Education level', 'Taleemi marhala'),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () async {
              if (_nameController.text.trim().isEmpty ||
                  _educationLevel == null) {
                return;
              }
              await ref
                  .read(sukoonStoreProvider)
                  .updateProfile(
                    firstName: _nameController.text.trim(),
                    educationLevel: _educationLevel,
                  );
              if (context.mounted) context.go('/onboarding/triggers');
            },
            child: Text(store.tr('Continue', 'Aagay')),
          ),
        ],
      ),
    );
  }
}

class TriggerOnboardingScreen extends ConsumerStatefulWidget {
  const TriggerOnboardingScreen({super.key});

  @override
  ConsumerState<TriggerOnboardingScreen> createState() =>
      _TriggerOnboardingScreenState();
}

class _TriggerOnboardingScreenState
    extends ConsumerState<TriggerOnboardingScreen> {
  late Set<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = {...ref.read(sukoonStoreProvider).profile.stressTriggers};
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return _OnboardingScaffold(
      step: 2,
      title: store.tr(
        'What is weighing on you lately?',
        'In dino kis cheez ka bojh zyada hai?',
      ),
      subtitle: store.tr(
        'Choose as many as feel true.',
        'Jitni cheezein sach lagti hain, unhein chun lo.',
      ),
      hero: _OnboardingHero(
        background: const Color(0xFFF7E5DE),
        child: const Icon(
          Icons.psychology_alt_rounded,
          size: 72,
          color: AppTheme.primaryDark,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final trigger in AppContent.stressTriggers)
                FilterChip(
                  selected: _selected.contains(trigger),
                  label: Text(trigger),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selected.add(trigger);
                      } else {
                        _selected.remove(trigger);
                      }
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () async {
              await ref
                  .read(sukoonStoreProvider)
                  .updateProfile(stressTriggers: _selected.toList());
              if (context.mounted) context.go('/onboarding/notifications');
            },
            child: Text(store.tr('Continue', 'Aagay')),
          ),
        ],
      ),
    );
  }
}

class NotificationOnboardingScreen extends ConsumerStatefulWidget {
  const NotificationOnboardingScreen({super.key});

  @override
  ConsumerState<NotificationOnboardingScreen> createState() =>
      _NotificationOnboardingScreenState();
}

class _NotificationOnboardingScreenState
    extends ConsumerState<NotificationOnboardingScreen> {
  late bool _enabled;
  late TimeOfDay _morning;
  late TimeOfDay _evening;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(sukoonStoreProvider).notificationPreferences;
    _enabled = prefs.remindersEnabled;
    _morning = TimeOfDay(hour: prefs.morningHour, minute: prefs.morningMinute);
    _evening = TimeOfDay(hour: prefs.eveningHour, minute: prefs.eveningMinute);
  }

  Future<void> _pickTime({required bool morning}) async {
    final current = morning ? _morning : _evening;
    final picked = await showTimePicker(context: context, initialTime: current);
    if (picked == null) return;
    setState(() {
      if (morning) {
        _morning = picked;
      } else {
        _evening = picked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return _OnboardingScaffold(
      step: 3,
      title: store.tr(
        'Let us check in with you daily.',
        'Rozana aap se halka sa check-in rakhein?',
      ),
      subtitle: store.tr(
        'Set two gentle reminders to pause, reflect, and log your mood.',
        'Do narm reminders set karein taa ke aap ruk kar apna haal dekh sakein.',
      ),
      hero: _OnboardingHero(
        background: AppTheme.tertiaryLight,
        child: const Icon(
          Icons.notifications_active_rounded,
          size: 68,
          color: AppTheme.tertiary,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryLight,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.tr('Enable reminders', 'Reminders on karein'),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        store.tr(
                          'Morning check-in and evening reflection',
                          'Morning check-in aur evening reflection',
                        ),
                      ),
                    ],
                  ),
                ),
                Switch.adaptive(
                  value: _enabled,
                  onChanged: (value) => setState(() => _enabled = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _ReminderTile(
            title: store.tr('Morning', 'Morning'),
            subtitle: _morning.format(context),
            icon: Icons.wb_sunny_rounded,
            iconColor: const Color(0xFFF59E0B),
            enabled: _enabled,
            onTap: () => _pickTime(morning: true),
          ),
          const SizedBox(height: 12),
          _ReminderTile(
            title: store.tr('Evening', 'Evening'),
            subtitle: _evening.format(context),
            icon: Icons.mode_night_rounded,
            iconColor: const Color(0xFF4B5563),
            enabled: _enabled,
            onTap: () => _pickTime(morning: false),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () async {
              await ref
                  .read(sukoonStoreProvider)
                  .updateNotificationPreferences(
                    remindersEnabled: _enabled,
                    morningHour: _morning.hour,
                    morningMinute: _morning.minute,
                    eveningHour: _evening.hour,
                    eveningMinute: _evening.minute,
                  );
              await ref
                  .read(sukoonStoreProvider)
                  .updateProfile(onboardingComplete: true);
              if (context.mounted) context.go('/home');
            },
            child: Text(store.tr('Finish', 'Mukammal')),
          ),
        ],
      ),
    );
  }
}

class _OnboardingScaffold extends StatelessWidget {
  const _OnboardingScaffold({
    required this.step,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.hero,
  });

  final int step;
  final String title;
  final String subtitle;
  final Widget child;
  final Widget hero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: AppTheme.background),
        child: SafeArea(
          child: SukoonContent(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: List.generate(
                      3,
                      (index) => Expanded(
                        child: Container(
                          height: 6,
                          margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
                          decoration: BoxDecoration(
                            color: index < step
                                ? AppTheme.primary
                                : AppTheme.neutral.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  hero,
                  const SizedBox(height: 24),
                  Expanded(
                    child: SukoonSectionCard(
                      title: title,
                      subtitle: subtitle,
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 300),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingHero extends StatelessWidget {
  const _OnboardingHero({required this.background, required this.child});

  final Color background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Padding(padding: const EdgeInsets.all(20), child: child),
    );
  }
}

class _ReminderTile extends StatelessWidget {
  const _ReminderTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.enabled,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(subtitle),
                  ],
                ),
              ),
              const Icon(Icons.schedule_rounded, color: AppTheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _softBlob(Color color, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}
