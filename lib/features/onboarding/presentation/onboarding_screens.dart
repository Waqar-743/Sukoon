import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 900), () {
      final store = ref.read(sukoonStoreProvider);
      if (!mounted || !store.isReady) return;
      context.go(store.onboardingComplete ? '/home' : '/onboarding/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.spa_rounded, size: 48),
                ),
                const SizedBox(height: 24),
                Text(
                  'Sukoon',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  store.tr(
                    'A calmer space for mood, focus, and honest reflection.',
                    'Mood, focus aur sachchi reflection ke liye aik pur-sukoon jagah.',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const CircularProgressIndicator(),
              ],
            ),
          ),
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
      title: store.tr(
        'Let us keep this simple.',
        'Chalo isay saadah rakhte hain.',
      ),
      subtitle: store.tr(
        'No account. No phone number. Just enough to make Sukoon feel like yours.',
        'Na account. Na phone number. Bas itna jo Sukoon ko tumhara sa bana de.',
      ),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: store.tr('First name', 'Pehla naam'),
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
          const Spacer(),
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
      title: store.tr(
        'What usually weighs on you?',
        'Aksar tum par kis cheez ka bojh hota hai?',
      ),
      subtitle: store.tr(
        'Choose the pressures you want Sukoon to notice gently.',
        'Un dabaoon ko chuno jinhein Sukoon narmi se notice kare.',
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
          const Spacer(),
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
      title: store.tr(
        'Want gentle reminders?',
        'Kya tum narm reminders chahte ho?',
      ),
      subtitle: store.tr(
        'You can change this later. Nothing here will guilt you for resting or missing a day.',
        'Baad mein yeh badla ja sakta hai. Yahan koi cheez tumhein aaraam ya missed day par sharminda nahin karegi.',
      ),
      child: Column(
        children: [
          SwitchListTile.adaptive(
            value: _enabled,
            title: Text(store.tr('Enable reminders', 'Reminders on karo')),
            subtitle: Text(
              store.tr(
                'Morning check-in and evening reflection',
                'Morning check-in aur evening reflection',
              ),
            ),
            onChanged: (value) => setState(() => _enabled = value),
          ),
          const SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            tileColor: Colors.white,
            title: Text(store.tr('Morning check-in', 'Morning check-in')),
            subtitle: Text(_morning.format(context)),
            trailing: const Icon(Icons.schedule),
            onTap: _enabled ? () => _pickTime(morning: true) : null,
          ),
          const SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            tileColor: Colors.white,
            title: Text(store.tr('Evening reflection', 'Evening reflection')),
            subtitle: Text(_evening.format(context)),
            trailing: const Icon(Icons.schedule_outlined),
            onTap: _enabled ? () => _pickTime(morning: false) : null,
          ),
          const Spacer(),
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
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10),
              Text(subtitle),
              const SizedBox(height: 24),
              Expanded(
                child: SukoonSectionCard(
                  title: 'Sukoon',
                  subtitle: 'Stored on your device only',
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
