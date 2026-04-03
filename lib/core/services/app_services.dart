import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:isar/isar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sukoon/core/models/app_models.dart';

class AppServices {
  AppServices({
    required this.isar,
    required this.prefs,
    required this.notifications,
    required this.privacy,
    required this.audio,
    required this.packageInfo,
    required this.connectivity,
  });

  final Isar isar;
  final SharedPreferences prefs;
  final NotificationService notifications;
  final PrivacyService privacy;
  final AudioService audio;
  final PackageInfo packageInfo;
  final ConnectivityService connectivity;

  static Future<AppServices> bootstrap() async {
    final directory = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        UserProfileRecordSchema,
        NotificationPreferenceRecordSchema,
        MoodEntryRecordSchema,
        JournalEntryRecordSchema,
        HabitRecordSchema,
        HabitCompletionRecordSchema,
        DetoxSessionRecordSchema,
        DetoxChallengeRecordSchema,
        PointsLedgerRecordSchema,
        BadgeUnlockRecordSchema,
        AffirmationFavoriteRecordSchema,
      ],
      directory: directory.path,
      inspector: false,
    );

    final prefs = await SharedPreferences.getInstance();
    final notifications = NotificationService();
    await notifications.initialize();
    final audio = AudioService();
    await audio.initialize();

    return AppServices(
      isar: isar,
      prefs: prefs,
      notifications: notifications,
      privacy: PrivacyService(),
      audio: audio,
      packageInfo: await PackageInfo.fromPlatform(),
      connectivity: ConnectivityService(),
    );
  }
}

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    try {
      const settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      );
      await _plugin.initialize(settings: settings);
    } catch (_) {}
  }

  Future<void> syncPreference({required bool enabled}) async {
    try {
      if (!enabled) {
        await _plugin.cancelAll();
        return;
      }

      if (defaultTargetPlatform == TargetPlatform.android) {
        await _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.requestNotificationsPermission();
      }

      if (defaultTargetPlatform == TargetPlatform.iOS) {
        await _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >()
            ?.requestPermissions(alert: true, badge: true, sound: true);
      }
    } catch (_) {}
  }
}

class PrivacyService {
  final LocalAuthentication _authentication = LocalAuthentication();

  Future<bool> canUseBiometrics() async {
    try {
      return await _authentication.canCheckBiometrics ||
          await _authentication.isDeviceSupported();
    } catch (_) {
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      return await _authentication.authenticate(
        localizedReason: 'Unlock your private journal',
        persistAcrossBackgrounding: true,
      );
    } catch (_) {
      return false;
    }
  }
}

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  bool _ready = false;

  Future<void> initialize() async {
    try {
      await _player.setAsset('assets/audio/calm_chime.wav');
      _ready = true;
    } catch (_) {
      _ready = false;
    }
  }

  Future<void> playChime() async {
    if (!_ready) return;
    await _player.seek(Duration.zero);
    await _player.play();
  }

  Future<void> dispose() => _player.dispose();
}

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> isOnline() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return !result.contains(ConnectivityResult.none);
    } catch (_) {
      return false;
    }
  }
}
