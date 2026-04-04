import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/models/app_models.dart';
import 'package:sukoon/core/services/app_services.dart';

final sukoonStoreProvider = ChangeNotifierProvider<SukoonStore>(
  (ref) =>
      throw UnimplementedError('SukoonStore must be overridden in main().'),
);

class SukoonStore extends ChangeNotifier {
  SukoonStore._(this.services);

  final AppServices services;

  static Future<SukoonStore> bootstrap() async {
    final services = await AppServices.bootstrap();
    final store = SukoonStore._(services);
    try {
      await store.load().timeout(const Duration(seconds: 10));
    } catch (error) {
      debugPrint(
        'Sukoon startup: failed to restore state, recovering with defaults. $error',
      );
      await store._recoverFromBootstrapFailure();
    }
    return store;
  }

  bool isReady = false;

  UserProfileRecord profile = UserProfileRecord();
  NotificationPreferenceRecord notificationPreferences =
      NotificationPreferenceRecord();
  List<MoodEntryRecord> moods = [];
  List<JournalEntryRecord> journalEntries = [];
  List<HabitRecord> habits = [];
  List<HabitCompletionRecord> completions = [];
  List<DetoxSessionRecord> detoxSessions = [];
  List<DetoxChallengeRecord> detoxChallenges = [];
  List<PointsLedgerRecord> pointsLedger = [];
  List<BadgeUnlockRecord> badgeUnlocks = [];
  List<AffirmationFavoriteRecord> affirmationFavorites = [];
  List<CommunityPreviewPost> communityPosts = [];

  String get languageCode => profile.languageCode;
  bool get isUrdu => languageCode == 'ur';
  bool get onboardingComplete => profile.onboardingComplete;
  bool get biometricEnabled =>
      services.prefs.getBool('biometricEnabled') ?? false;
  String get appVersion => services.packageInfo.version;

  String tr(String en, String ur) => isUrdu ? ur : en;
  String pick(LocalizedText text) => text.valueFor(languageCode);

  Future<void> load() async {
    await _ensureDefaults();
    final isar = services.isar;

    if (isar != null) {
      profile = await isar.userProfileRecords.get(1) ?? UserProfileRecord();
      notificationPreferences =
          await isar.notificationPreferenceRecords.get(1) ??
          NotificationPreferenceRecord();
    } else {
      profile =
          _readRecord('cache_profile', _profileFromJson) ?? UserProfileRecord();
      notificationPreferences =
          _readRecord(
            'cache_notification_preferences',
            _notificationPreferencesFromJson,
          ) ??
          NotificationPreferenceRecord();
    }
    moods = _readList('cache_moods', _moodFromJson)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    journalEntries = _readList('cache_journal_entries', _journalFromJson)
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    habits = _readList('cache_habits', _habitFromJson)
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    completions = _readList('cache_habit_completions', _habitCompletionFromJson)
      ..sort((a, b) => b.day.compareTo(a.day));
    detoxSessions = _readList('cache_detox_sessions', _detoxSessionFromJson)
      ..sort((a, b) => b.startedAt.compareTo(a.startedAt));
    detoxChallenges = _readList(
      'cache_detox_challenges',
      _detoxChallengeFromJson,
    )..sort((a, b) => b.startedAt.compareTo(a.startedAt));
    pointsLedger = _readList('cache_points', _pointsFromJson)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    badgeUnlocks = _readList('cache_badges', _badgeFromJson)
      ..sort((a, b) => b.unlockedAt.compareTo(a.unlockedAt));
    affirmationFavorites = _readList(
      'cache_favorites',
      _affirmationFavoriteFromJson,
    )..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    communityPosts = await _loadCommunityPosts();

    if (communityPosts.isEmpty) {
      communityPosts = [...AppContent.previewCommunityPosts];
    }

    isReady = true;
    notifyListeners();
  }

  Future<void> _recoverFromBootstrapFailure() async {
    profile = UserProfileRecord();
    notificationPreferences = NotificationPreferenceRecord();
    moods = [];
    journalEntries = [];
    habits = [];
    completions = [];
    detoxSessions = [];
    detoxChallenges = [];
    pointsLedger = [];
    badgeUnlocks = [];
    affirmationFavorites = [];
    communityPosts = [...AppContent.previewCommunityPosts];
    isReady = true;

    try {
      await _persistPrimaryCaches();
      await _persistCaches();
      await _saveCommunityPosts();
    } catch (_) {}

    notifyListeners();
  }

  Future<void> _ensureDefaults() async {
    final isar = services.isar;
    if (isar == null) {
      await _persistPrimaryCaches();
      return;
    }

    await isar.writeTxn(() async {
      if (await isar.userProfileRecords.get(1) == null) {
        await isar.userProfileRecords.put(UserProfileRecord());
      }
      if (await isar.notificationPreferenceRecords.get(1) == null) {
        await isar.notificationPreferenceRecords.put(
          NotificationPreferenceRecord(),
        );
      }
    });
  }

  Future<List<CommunityPreviewPost>> _loadCommunityPosts() async {
    final rawPosts =
        services.prefs.getStringList('community_posts') ?? <String>[];
    final posts = <CommunityPreviewPost>[];
    var hadCorruptEntry = false;

    for (final item in rawPosts) {
      try {
        final parsed = jsonDecode(item);
        if (parsed is! Map) {
          hadCorruptEntry = true;
          continue;
        }
        posts.add(
          CommunityPreviewPost.fromJson(
            Map<String, dynamic>.from(parsed),
          ),
        );
      } catch (_) {
        hadCorruptEntry = true;
      }
    }

    posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (hadCorruptEntry) {
      await services.prefs.setStringList(
        'community_posts',
        posts.map((post) => jsonEncode(post.toJson())).toList(),
      );
    }

    return posts;
  }

  Future<void> _saveCommunityPosts() async {
    final data = communityPosts
        .map((post) => jsonEncode(post.toJson()))
        .toList();
    await services.prefs.setStringList('community_posts', data);
  }

  T? _readRecord<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final raw = services.prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return null;
    }
    try {
      final parsed = jsonDecode(raw);
      if (parsed is! Map) {
        throw const FormatException('Expected JSON object');
      }
      return fromJson(Map<String, dynamic>.from(parsed));
    } catch (error) {
      debugPrint(
        'Sukoon cache recovery: resetting "$key" due to invalid JSON. $error',
      );
      unawaited(services.prefs.remove(key));
      return null;
    }
  }

  List<T> _readList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final raw = services.prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return [];
    }
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) {
        throw const FormatException('Expected JSON list');
      }

      final items = <T>[];
      for (final item in decoded) {
        try {
          if (item is! Map) continue;
          items.add(fromJson(Map<String, dynamic>.from(item)));
        } catch (_) {}
      }
      return items;
    } catch (error) {
      debugPrint(
        'Sukoon cache recovery: resetting "$key" due to invalid JSON. $error',
      );
      unawaited(services.prefs.remove(key));
      return [];
    }
  }

  Future<void> _persistPrimaryCaches() async {
    await services.prefs.setString(
      'cache_profile',
      jsonEncode(profile.toJson()),
    );
    await services.prefs.setString(
      'cache_notification_preferences',
      jsonEncode(notificationPreferences.toJson()),
    );
  }

  Future<void> _persistCaches() async {
    await services.prefs.setString(
      'cache_moods',
      jsonEncode(moods.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_journal_entries',
      jsonEncode(journalEntries.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_habits',
      jsonEncode(habits.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_habit_completions',
      jsonEncode(completions.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_detox_sessions',
      jsonEncode(detoxSessions.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_detox_challenges',
      jsonEncode(detoxChallenges.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_points',
      jsonEncode(pointsLedger.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_badges',
      jsonEncode(badgeUnlocks.map((item) => item.toJson()).toList()),
    );
    await services.prefs.setString(
      'cache_favorites',
      jsonEncode(affirmationFavorites.map((item) => item.toJson()).toList()),
    );
  }

  Future<void> _writeTxn(Future<void> Function(Isar isar) action) async {
    final isar = services.isar;
    if (isar == null) return;
    await isar.writeTxn(() async {
      await action(isar);
    });
  }

  int _nextLocalId(Iterable<int> existingIds) {
    final now = DateTime.now().microsecondsSinceEpoch;
    final maxId = existingIds.fold<int>(0, (max, id) => id > max ? id : max);
    return now > maxId ? now : maxId + 1;
  }

  UserProfileRecord _profileFromJson(Map<String, dynamic> json) {
    return UserProfileRecord()
      ..firstName = json['firstName'] as String? ?? ''
      ..educationLevel = json['educationLevel'] as String? ?? ''
      ..stressTriggers = (json['stressTriggers'] as List<dynamic>? ?? [])
          .cast<String>()
      ..languageCode = json['languageCode'] as String? ?? 'en'
      ..onboardingComplete = json['onboardingComplete'] as bool? ?? false;
  }

  NotificationPreferenceRecord _notificationPreferencesFromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationPreferenceRecord()
      ..remindersEnabled = json['remindersEnabled'] as bool? ?? true
      ..detoxProgressEnabled = json['detoxProgressEnabled'] as bool? ?? true
      ..weeklyInsightsEnabled = json['weeklyInsightsEnabled'] as bool? ?? true
      ..morningHour = (json['morningHour'] as num?)?.toInt() ?? 8
      ..morningMinute = (json['morningMinute'] as num?)?.toInt() ?? 0
      ..eveningHour = (json['eveningHour'] as num?)?.toInt() ?? 20
      ..eveningMinute = (json['eveningMinute'] as num?)?.toInt() ?? 0;
  }

  MoodEntryRecord _moodFromJson(Map<String, dynamic> json) {
    return MoodEntryRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..score = (json['score'] as num?)?.toInt() ?? 3
      ..emotionTags = (json['emotionTags'] as List<dynamic>? ?? [])
          .cast<String>()
      ..note = json['note'] as String? ?? ''
      ..manualScrollMinutes = (json['manualScrollMinutes'] as num?)?.toInt();
  }

  JournalEntryRecord _journalFromJson(Map<String, dynamic> json) {
    return JournalEntryRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..updatedAt = DateTime.parse(json['updatedAt'] as String)
      ..title = json['title'] as String? ?? ''
      ..body = json['body'] as String? ?? ''
      ..promptId = json['promptId'] as String?
      ..promptCategory = json['promptCategory'] as String?
      ..moodEntryId = (json['moodEntryId'] as num?)?.toInt()
      ..locked = json['locked'] as bool? ?? false;
  }

  HabitRecord _habitFromJson(Map<String, dynamic> json) {
    return HabitRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..name = json['name'] as String? ?? ''
      ..category = json['category'] as String? ?? 'Study'
      ..frequency = json['frequency'] as String? ?? 'Daily'
      ..active = json['active'] as bool? ?? true;
  }

  HabitCompletionRecord _habitCompletionFromJson(Map<String, dynamic> json) {
    return HabitCompletionRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..habitId = (json['habitId'] as num?)?.toInt() ?? 0
      ..day = DateTime.parse(json['day'] as String)
      ..completedAt = DateTime.parse(json['completedAt'] as String);
  }

  DetoxSessionRecord _detoxSessionFromJson(Map<String, dynamic> json) {
    return DetoxSessionRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..type = json['type'] as String? ?? 'quick'
      ..plannedMinutes = (json['plannedMinutes'] as num?)?.toInt() ?? 10
      ..startedAt = DateTime.parse(json['startedAt'] as String)
      ..endedAt = json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String)
      ..status = json['status'] as String? ?? 'active'
      ..replacementActivity = json['replacementActivity'] as String? ?? ''
      ..reflectionNote = json['reflectionNote'] as String? ?? '';
  }

  DetoxChallengeRecord _detoxChallengeFromJson(Map<String, dynamic> json) {
    return DetoxChallengeRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..templateId = json['templateId'] as String? ?? ''
      ..name = json['name'] as String? ?? ''
      ..totalDays = (json['totalDays'] as num?)?.toInt() ?? 3
      ..completedDays = (json['completedDays'] as num?)?.toInt() ?? 0
      ..active = json['active'] as bool? ?? true
      ..startedAt = DateTime.parse(json['startedAt'] as String);
  }

  PointsLedgerRecord _pointsFromJson(Map<String, dynamic> json) {
    return PointsLedgerRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..reason = json['reason'] as String? ?? ''
      ..points = (json['points'] as num?)?.toInt() ?? 0;
  }

  BadgeUnlockRecord _badgeFromJson(Map<String, dynamic> json) {
    return BadgeUnlockRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..badgeId = json['badgeId'] as String? ?? ''
      ..title = json['title'] as String? ?? ''
      ..description = json['description'] as String? ?? ''
      ..unlockedAt = DateTime.parse(json['unlockedAt'] as String);
  }

  AffirmationFavoriteRecord _affirmationFavoriteFromJson(
    Map<String, dynamic> json,
  ) {
    return AffirmationFavoriteRecord()
      ..id = (json['id'] as num?)?.toInt() ?? 0
      ..affirmationId = json['affirmationId'] as String? ?? ''
      ..createdAt = DateTime.parse(json['createdAt'] as String);
  }

  Future<void> updateProfile({
    String? firstName,
    String? educationLevel,
    List<String>? stressTriggers,
    String? languageCode,
    bool? onboardingComplete,
  }) async {
    profile
      ..firstName = firstName ?? profile.firstName
      ..educationLevel = educationLevel ?? profile.educationLevel
      ..stressTriggers = stressTriggers ?? profile.stressTriggers
      ..languageCode = languageCode ?? profile.languageCode
      ..onboardingComplete = onboardingComplete ?? profile.onboardingComplete;

    await _writeTxn((isar) async {
      await isar.userProfileRecords.put(profile);
    });
    await _persistPrimaryCaches();
    notifyListeners();
  }

  Future<void> updateNotificationPreferences({
    bool? remindersEnabled,
    bool? detoxProgressEnabled,
    bool? weeklyInsightsEnabled,
    int? morningHour,
    int? morningMinute,
    int? eveningHour,
    int? eveningMinute,
  }) async {
    notificationPreferences
      ..remindersEnabled =
          remindersEnabled ?? notificationPreferences.remindersEnabled
      ..detoxProgressEnabled =
          detoxProgressEnabled ?? notificationPreferences.detoxProgressEnabled
      ..weeklyInsightsEnabled =
          weeklyInsightsEnabled ?? notificationPreferences.weeklyInsightsEnabled
      ..morningHour = morningHour ?? notificationPreferences.morningHour
      ..morningMinute = morningMinute ?? notificationPreferences.morningMinute
      ..eveningHour = eveningHour ?? notificationPreferences.eveningHour
      ..eveningMinute = eveningMinute ?? notificationPreferences.eveningMinute;

    await _writeTxn((isar) async {
      await isar.notificationPreferenceRecords.put(notificationPreferences);
    });

    await _persistPrimaryCaches();
    await services.notifications.syncPreference(
      enabled: notificationPreferences.remindersEnabled,
    );
    notifyListeners();
  }

  Future<void> setBiometricEnabled(bool value) async {
    if (value) {
      final available = await services.privacy.canUseBiometrics();
      if (!available) return;
    }
    await services.prefs.setBool('biometricEnabled', value);
    notifyListeners();
  }

  Future<bool> authenticateJournal() async {
    if (!biometricEnabled) return true;
    return services.privacy.authenticate();
  }

  MoodEntryRecord? get todayMood {
    final today = DateUtils.dateOnly(DateTime.now());
    return moods.firstWhereOrNull(
      (entry) => DateUtils.isSameDay(entry.createdAt, today),
    );
  }

  int get totalPoints =>
      pointsLedger.fold<int>(0, (sum, item) => sum + item.points);

  int get moodStreak =>
      _consecutiveDays(moods.map((entry) => entry.createdAt).toList());

  int get journalStreak =>
      _consecutiveDays(journalEntries.map((entry) => entry.updatedAt).toList());

  int _consecutiveDays(List<DateTime> dates) {
    if (dates.isEmpty) return 0;
    final uniqueDays = dates.map(DateUtils.dateOnly).toSet().toList()
      ..sort((a, b) => b.compareTo(a));

    var streak = 0;
    var cursor = DateUtils.dateOnly(DateTime.now());
    for (final day in uniqueDays) {
      if (DateUtils.isSameDay(day, cursor)) {
        streak += 1;
        cursor = cursor.subtract(const Duration(days: 1));
      } else if (day.isBefore(cursor)) {
        break;
      }
    }
    return streak;
  }

  List<MoodEntryRecord> get recentMoodEntries =>
      moods.take(7).toList().reversed.toList();

  double get weeklyAverageMood {
    if (recentMoodEntries.isEmpty) return 0;
    final total = recentMoodEntries.fold<int>(
      0,
      (sum, item) => sum + item.score,
    );
    return total / recentMoodEntries.length;
  }

  int? get baselineScrollMinutes {
    final values = moods
        .map((entry) => entry.manualScrollMinutes)
        .whereType<int>()
        .where((value) => value > 0)
        .toList();
    if (values.isEmpty) return null;
    return values.reduce((a, b) => a + b) ~/ values.length;
  }

  int? get recentScrollAverage {
    final values = recentMoodEntries
        .map((entry) => entry.manualScrollMinutes)
        .whereType<int>()
        .where((value) => value > 0)
        .toList();
    if (values.isEmpty) return null;
    return values.reduce((a, b) => a + b) ~/ values.length;
  }

  bool get shouldShowEmergencyKit => (todayMood?.score ?? 5) <= 2;

  bool get shouldShowFomoReframe {
    final mood = todayMood;
    final baseline = baselineScrollMinutes;
    if (mood == null || baseline == null) return false;
    return mood.score <= 2 && (mood.manualScrollMinutes ?? 0) >= baseline;
  }

  String get correlationSummary {
    final baseline = baselineScrollMinutes;
    final recent = recentScrollAverage;
    if (baseline == null || recent == null) {
      return tr(
        'Screen-time analytics are in manual mode on this build. You can still log your own scroll estimate for kinder insights.',
        'Is build mein screen-time analytics manual mode par hain. Aap apna scroll estimate likh kar phir bhi narmi se insight hasil kar sakte hain.',
      );
    }
    if ((todayMood?.score ?? 3) <= 2 && recent >= baseline) {
      return tr(
        '$recent minutes is a lot of attention. What did scrolling seem to promise you today?',
        '$recent minute tumhari tawajju ka bohat hissa hai. Aaj scrolling ne tumhein kya wada kiya tha?',
      );
    }
    return tr(
      'Your recent scrolling is close to your usual pattern. Gentle awareness still matters.',
      'Tumhari recent scrolling tumhari aam aadat ke qareeb hai. Narmi se notice karna phir bhi zaroori hai.',
    );
  }

  Map<String, int> get emotionCounts {
    final counts = <String, int>{};
    for (final mood in moods.take(14)) {
      for (final tag in mood.emotionTags) {
        counts.update(tag, (value) => value + 1, ifAbsent: () => 1);
      }
    }
    final entries = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Map.fromEntries(entries.take(5));
  }

  Future<void> addMoodEntry({
    required int score,
    required List<String> emotionTags,
    required String note,
    int? manualScrollMinutes,
  }) async {
    final entry = MoodEntryRecord()
      ..createdAt = DateTime.now()
      ..score = score
      ..emotionTags = emotionTags
      ..note = note.trim()
      ..manualScrollMinutes = manualScrollMinutes;

    if (services.isar == null) {
      entry.id = _nextLocalId(moods.map((item) => item.id));
    }

    await _writeTxn((isar) async {
      await isar.moodEntryRecords.put(entry);
    });

    moods = [entry, ...moods];
    await _awardPoints('Mood check-in', 8);
    await _maybeUnlockBadge('first_checkin', moods.isNotEmpty);
    await _persistCaches();
    notifyListeners();
  }

  MoodEntryRecord? moodById(int? id) {
    if (id == null) return null;
    return moods.firstWhereOrNull((entry) => entry.id == id);
  }

  Future<int> saveJournalEntry({
    int? id,
    required String title,
    required String body,
    String? promptId,
    String? promptCategory,
    int? moodEntryId,
    bool locked = false,
  }) async {
    final isNew = id == null;
    final entry = isNew
        ? JournalEntryRecord()
        : (journalEntries.firstWhereOrNull((item) => item.id == id) ??
              JournalEntryRecord());

    if (isNew) {
      entry.createdAt = DateTime.now();
    }

    entry
      ..updatedAt = DateTime.now()
      ..title = title.trim()
      ..body = body.trim()
      ..promptId = promptId
      ..promptCategory = promptCategory
      ..moodEntryId = moodEntryId
      ..locked = locked;

    if (isNew && services.isar == null) {
      entry.id = _nextLocalId(journalEntries.map((item) => item.id));
    }

    await _writeTxn((isar) async {
      await isar.journalEntryRecords.put(entry);
    });

    journalEntries.removeWhere((item) => item.id == entry.id);
    journalEntries = [entry, ...journalEntries];
    if (isNew && body.trim().isNotEmpty) {
      await _awardPoints('Journaled', 10);
    }
    await _maybeUnlockBadge('journal_three', journalEntries.length >= 3);
    await _persistCaches();
    notifyListeners();
    return entry.id;
  }

  Future<void> deleteJournalEntry(int id) async {
    await _writeTxn((isar) async {
      await isar.journalEntryRecords.delete(id);
    });
    journalEntries.removeWhere((item) => item.id == id);
    await _persistCaches();
    notifyListeners();
  }

  Future<void> upsertHabit({
    int? id,
    required String name,
    required String category,
    required String frequency,
  }) async {
    final habit = id == null
        ? HabitRecord()
        : (habits.firstWhereOrNull((item) => item.id == id) ?? HabitRecord());

    habit
      ..name = name.trim()
      ..category = category
      ..frequency = frequency
      ..active = true;

    if (id == null && services.isar == null) {
      habit.id = _nextLocalId(habits.map((item) => item.id));
    }

    await _writeTxn((isar) async {
      await isar.habitRecords.put(habit);
    });
    habits.removeWhere((item) => item.id == habit.id);
    habits = [...habits, habit];
    await _persistCaches();
    notifyListeners();
  }

  Future<void> toggleHabitCompletion(HabitRecord habit, DateTime day) async {
    final normalized = DateUtils.dateOnly(day);
    final existing = completions.firstWhereOrNull(
      (item) =>
          item.habitId == habit.id && DateUtils.isSameDay(item.day, normalized),
    );

    if (existing != null) {
      await _writeTxn((isar) async {
        await isar.habitCompletionRecords.delete(existing.id);
      });
    }

    HabitCompletionRecord? createdCompletion;
    if (existing == null) {
      createdCompletion = HabitCompletionRecord()
        ..habitId = habit.id
        ..day = normalized
        ..completedAt = DateTime.now();
      if (services.isar == null) {
        createdCompletion.id = _nextLocalId(completions.map((item) => item.id));
      }
      final completion = createdCompletion;
      await _writeTxn((isar) async {
        await isar.habitCompletionRecords.put(completion);
      });
    }

    if (existing != null) {
      completions.removeWhere((item) => item.id == existing.id);
    } else if (createdCompletion != null) {
      completions = [createdCompletion, ...completions];
      await _awardPoints('Habit completed', 6);
      await _maybeUnlockBadge('habit_five', completions.length >= 5);
    }
    await _persistCaches();
    notifyListeners();
  }

  bool isHabitDoneOn(HabitRecord habit, DateTime date) {
    return completions.any(
      (item) => item.habitId == habit.id && DateUtils.isSameDay(item.day, date),
    );
  }

  int habitStreak(HabitRecord habit) {
    final days = completions
        .where((item) => item.habitId == habit.id)
        .map((item) => item.day)
        .toList();
    return _consecutiveDays(days);
  }

  Future<int> startDetoxSession({
    required String type,
    required int plannedMinutes,
    required String replacementActivity,
  }) async {
    final session = DetoxSessionRecord()
      ..type = type
      ..plannedMinutes = plannedMinutes
      ..startedAt = DateTime.now()
      ..status = 'active'
      ..replacementActivity = replacementActivity;

    if (services.isar == null) {
      session.id = _nextLocalId(detoxSessions.map((item) => item.id));
    }

    await _writeTxn((isar) async {
      await isar.detoxSessionRecords.put(session);
    });
    detoxSessions = [session, ...detoxSessions];
    await _persistCaches();
    notifyListeners();
    return session.id;
  }

  Future<void> finishDetoxSession({
    required int id,
    required bool completed,
    required String reflectionNote,
  }) async {
    final session = detoxSessions.firstWhereOrNull((item) => item.id == id);
    if (session == null) return;

    session
      ..endedAt = DateTime.now()
      ..status = completed ? 'completed' : 'ended_early'
      ..reflectionNote = reflectionNote.trim();

    await _writeTxn((isar) async {
      await isar.detoxSessionRecords.put(session);
    });

    if (completed) {
      await _awardPoints('Detox session', 12);
      await services.audio.playChime();
      await _maybeUnlockBadge(
        'detox_three',
        completedDetoxSessions.length + 1 >= 3,
      );
    }

    detoxSessions.removeWhere((item) => item.id == session.id);
    detoxSessions = [session, ...detoxSessions];
    await _refreshChallengeProgress();
    await _persistCaches();
    notifyListeners();
  }

  List<DetoxSessionRecord> get completedDetoxSessions =>
      detoxSessions.where((item) => item.status == 'completed').toList();

  Future<void> activateChallenge(DetoxChallengeTemplate template) async {
    final existing = detoxChallenges.firstWhereOrNull((item) => item.active);
    if (existing != null) {
      existing.active = false;
      await _writeTxn((isar) async {
        await isar.detoxChallengeRecords.put(existing);
      });
    }

    final record = DetoxChallengeRecord()
      ..templateId = template.id
      ..name = template.title.en
      ..totalDays = template.days
      ..completedDays = 0
      ..active = true
      ..startedAt = DateTime.now();
    if (services.isar == null) {
      record.id = _nextLocalId(detoxChallenges.map((item) => item.id));
    }
    await _writeTxn((isar) async {
      await isar.detoxChallengeRecords.put(record);
    });

    if (existing != null) {
      detoxChallenges.removeWhere((item) => item.id == existing.id);
      detoxChallenges = [existing, ...detoxChallenges];
    }
    detoxChallenges = [
      record,
      ...detoxChallenges.where((item) => item.id != record.id),
    ];
    await _persistCaches();
    notifyListeners();
  }

  Future<void> _refreshChallengeProgress() async {
    final active = detoxChallenges.firstWhereOrNull((item) => item.active);
    if (active == null) return;

    final completionDays = completedDetoxSessions
        .where(
          (session) => session.startedAt.isAfter(
            active.startedAt.subtract(const Duration(days: 1)),
          ),
        )
        .map((session) => DateUtils.dateOnly(session.startedAt))
        .toSet()
        .length;

    active.completedDays = completionDays.clamp(0, active.totalDays);
    if (active.completedDays >= active.totalDays) {
      active.active = false;
      await _awardPoints('Completed challenge', 20);
    }

    await _writeTxn((isar) async {
      await isar.detoxChallengeRecords.put(active);
    });
  }

  Future<void> toggleAffirmationFavorite(String affirmationId) async {
    final existing = affirmationFavorites.firstWhereOrNull(
      (item) => item.affirmationId == affirmationId,
    );
    if (existing != null) {
      await _writeTxn((isar) async {
        await isar.affirmationFavoriteRecords.delete(existing.id);
      });
    }

    AffirmationFavoriteRecord? favorite;
    if (existing == null) {
      favorite = AffirmationFavoriteRecord()
        ..affirmationId = affirmationId
        ..createdAt = DateTime.now();
      if (services.isar == null) {
        favorite.id = _nextLocalId(affirmationFavorites.map((item) => item.id));
      }
      final createdFavorite = favorite;
      await _writeTxn((isar) async {
        await isar.affirmationFavoriteRecords.put(createdFavorite);
      });
    }

    if (existing != null) {
      affirmationFavorites.removeWhere((item) => item.id == existing.id);
    } else if (favorite != null) {
      affirmationFavorites = [favorite, ...affirmationFavorites];
    }
    await _persistCaches();
    notifyListeners();
  }

  bool isFavoriteAffirmation(String affirmationId) {
    return affirmationFavorites.any(
      (item) => item.affirmationId == affirmationId,
    );
  }

  Future<bool> canUseBiometrics() => services.privacy.canUseBiometrics();

  Future<bool> checkCommunityConnectivity() => services.connectivity.isOnline();

  Future<XFile> exportData() async {
    final payload = <String, dynamic>{
      'exportedAt': DateTime.now().toIso8601String(),
      'profile': profile.toJson(),
      'notificationPreferences': notificationPreferences.toJson(),
      'moods': moods.map((item) => item.toJson()).toList(),
      'journalEntries': journalEntries.map((item) => item.toJson()).toList(),
      'habits': habits.map((item) => item.toJson()).toList(),
      'completions': completions.map((item) => item.toJson()).toList(),
      'detoxSessions': detoxSessions.map((item) => item.toJson()).toList(),
      'detoxChallenges': detoxChallenges.map((item) => item.toJson()).toList(),
      'points': pointsLedger.map((item) => item.toJson()).toList(),
      'badges': badgeUnlocks.map((item) => item.toJson()).toList(),
    };

    final json = const JsonEncoder.withIndent('  ').convert(payload);
    if (kIsWeb) {
      return XFile.fromData(
        Uint8List.fromList(utf8.encode(json)),
        mimeType: 'application/json',
        name: 'sukoon_export.json',
      );
    }

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/sukoon_export.json');
    await file.writeAsString(json);
    return XFile(file.path);
  }

  Future<void> shareExport() async {
    final file = await exportData();
    await SharePlus.instance.share(
      ShareParams(text: 'Sukoon local data export', files: [file]),
    );
  }

  Future<void> clearAllData() async {
    await _writeTxn((isar) async {
      await isar.clear();
    });
    moods = [];
    journalEntries = [];
    habits = [];
    completions = [];
    detoxSessions = [];
    detoxChallenges = [];
    pointsLedger = [];
    badgeUnlocks = [];
    affirmationFavorites = [];
    communityPosts = [];
    for (final key in [
      'cache_profile',
      'cache_notification_preferences',
      'community_posts',
      'biometricEnabled',
      'cache_moods',
      'cache_journal_entries',
      'cache_habits',
      'cache_habit_completions',
      'cache_detox_sessions',
      'cache_detox_challenges',
      'cache_points',
      'cache_badges',
      'cache_favorites',
    ]) {
      await services.prefs.remove(key);
    }
    await load();
  }

  Future<bool> saveCommunityPreviewPost(String body) async {
    final trimmed = body.trim();
    if (trimmed.isEmpty) return false;
    final lastPostMs = services.prefs.getInt('community_last_post_ms');
    if (lastPostMs != null) {
      final lastPost = DateTime.fromMillisecondsSinceEpoch(lastPostMs);
      if (DateTime.now().difference(lastPost) < const Duration(minutes: 2)) {
        return false;
      }
    }

    communityPosts = [
      CommunityPreviewPost(
        alias: 'Anonymous',
        body: trimmed,
        createdAt: DateTime.now(),
      ),
      ...communityPosts,
    ];
    await services.prefs.setInt(
      'community_last_post_ms',
      DateTime.now().millisecondsSinceEpoch,
    );
    await _saveCommunityPosts();
    notifyListeners();
    return true;
  }

  bool containsCrisisKeyword(String text) {
    final lower = text.toLowerCase();
    return AppContent.crisisKeywords.any(lower.contains);
  }

  Future<void> _awardPoints(String reason, int points) async {
    final record = PointsLedgerRecord()
      ..createdAt = DateTime.now()
      ..reason = reason
      ..points = points;
    if (services.isar == null) {
      record.id = _nextLocalId(pointsLedger.map((item) => item.id));
    }
    await _writeTxn((isar) async {
      await isar.pointsLedgerRecords.put(record);
    });
    pointsLedger = [record, ...pointsLedger];
    await _persistCaches();
  }

  Future<void> _maybeUnlockBadge(String badgeId, bool condition) async {
    if (!condition || badgeUnlocks.any((item) => item.badgeId == badgeId)) {
      return;
    }
    final spec = AppContent.badgeById(badgeId);
    if (spec == null) return;
    final record = BadgeUnlockRecord()
      ..badgeId = badgeId
      ..title = spec.title.en
      ..description = spec.description.en
      ..unlockedAt = DateTime.now();
    if (services.isar == null) {
      record.id = _nextLocalId(badgeUnlocks.map((item) => item.id));
    }
    await _writeTxn((isar) async {
      await isar.badgeUnlockRecords.put(record);
    });
    badgeUnlocks = [record, ...badgeUnlocks];
    await _persistCaches();
  }

  Future<void> guardedPush(BuildContext context, String location) async {
    if (!await authenticateJournal()) return;
    if (context.mounted) {
      context.push(location);
    }
  }
}
