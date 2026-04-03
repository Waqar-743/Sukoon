import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(title: Text(store.tr('Settings', 'Settings'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr('Profile', 'Profile'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${store.tr('Name', 'Naam')}: ${store.profile.firstName}'),
                const SizedBox(height: 8),
                Text(
                  '${store.tr('Education', 'Education')}: ${store.profile.educationLevel}',
                ),
                const SizedBox(height: 8),
                Text(
                  '${store.tr('Triggers', 'Triggers')}: ${store.profile.stressTriggers.join(', ')}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Language', 'Language'),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'en', label: Text('English')),
                ButtonSegment(value: 'ur', label: Text('Urdu')),
              ],
              selected: {store.languageCode},
              onSelectionChanged: (selection) => ref
                  .read(sukoonStoreProvider)
                  .updateProfile(languageCode: selection.first),
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Notifications', 'Notifications'),
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  value: store.notificationPreferences.remindersEnabled,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    store.tr('Enable reminders', 'Reminders on karo'),
                  ),
                  subtitle: Text(
                    '${DateFormat.Hm().format(DateTime(0, 1, 1, store.notificationPreferences.morningHour, store.notificationPreferences.morningMinute))} / ${DateFormat.Hm().format(DateTime(0, 1, 1, store.notificationPreferences.eveningHour, store.notificationPreferences.eveningMinute))}',
                  ),
                  onChanged: (value) => ref
                      .read(sukoonStoreProvider)
                      .updateNotificationPreferences(remindersEnabled: value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FutureBuilder<bool>(
            future: ref.read(sukoonStoreProvider).canUseBiometrics(),
            builder: (context, snapshot) {
              final available = snapshot.data ?? false;
              return SukoonSectionCard(
                title: store.tr('Privacy lock', 'Privacy lock'),
                subtitle: available
                    ? store.tr(
                        'Use biometrics before opening journal entries.',
                        'Journal entries kholne se pehle biometrics use karo.',
                      )
                    : store.tr(
                        'Biometric lock is not available on this device.',
                        'Is device par biometric lock dastiyab nahin.',
                      ),
                child: SwitchListTile.adaptive(
                  value: store.biometricEnabled,
                  contentPadding: EdgeInsets.zero,
                  onChanged: available
                      ? (value) => ref
                            .read(sukoonStoreProvider)
                            .setBiometricEnabled(value)
                      : null,
                  title: Text(store.tr('Lock journal', 'Journal lock karo')),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Badges & points', 'Badges & points'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${store.tr('Total points', 'Total points')}: ${store.totalPoints}',
                ),
                const SizedBox(height: 12),
                if (store.badgeUnlocks.isEmpty)
                  Text(
                    store.tr(
                      'Badges will appear as you keep showing up gently.',
                      'Jab tum narmi se wapas aate rahoge to badges yahan nazar aayenge.',
                    ),
                  )
                else
                  for (final badge in store.badgeUnlocks)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Chip(
                        label: Text(
                          '${badge.title} · ${DateFormat.yMMMd().format(badge.unlockedAt)}',
                        ),
                      ),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('Data actions', 'Data actions'),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    store.tr('Export my data', 'Mera data export karo'),
                  ),
                  trailing: const Icon(Icons.ios_share),
                  onTap: () => ref.read(sukoonStoreProvider).shareExport(),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    store.tr('Clear all data', 'Sara data clear karo'),
                  ),
                  trailing: const Icon(Icons.delete_forever_outlined),
                  onTap: () async {
                    final first =
                        await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              store.tr(
                                'Are you sure?',
                                'Kya tum yaqeen se keh rahe ho?',
                              ),
                            ),
                            content: Text(
                              store.tr(
                                'This deletes your local moods, journal, habits, detox history, and points.',
                                'Yeh tumhara local mood, journal, habits, detox history, aur points delete kar dega.',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(store.tr('Cancel', 'Cancel')),
                              ),
                              FilledButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(store.tr('Continue', 'Continue')),
                              ),
                            ],
                          ),
                        ) ??
                        false;
                    if (!first || !context.mounted) return;
                    final second =
                        await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              store.tr(
                                'Final confirmation',
                                'Aakhri confirmation',
                              ),
                            ),
                            content: Text(
                              store.tr(
                                'This cannot be undone.',
                                'Isay wapas nahin laya ja sakta.',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(
                                  store.tr('Keep data', 'Data rakho'),
                                ),
                              ),
                              FilledButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(store.tr('Delete', 'Delete')),
                              ),
                            ],
                          ),
                        ) ??
                        false;
                    if (!second) return;
                    await ref.read(sukoonStoreProvider).clearAllData();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            store.tr(
                              'All local data cleared.',
                              'Sara local data clear ho gaya.',
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SukoonSectionCard(
            title: store.tr('App info', 'App info'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${store.tr('Version', 'Version')}: ${store.appVersion}'),
                const SizedBox(height: 8),
                Text(store.pick(AppContent.emergencyContacts)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
