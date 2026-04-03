import 'package:isar/isar.dart';

part 'app_models.g.dart';

@collection
class UserProfileRecord {
  Id id = 1;

  String firstName = '';
  String educationLevel = '';
  List<String> stressTriggers = [];
  String languageCode = 'en';
  bool onboardingComplete = false;

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'educationLevel': educationLevel,
    'stressTriggers': stressTriggers,
    'languageCode': languageCode,
    'onboardingComplete': onboardingComplete,
  };
}

@collection
class NotificationPreferenceRecord {
  Id id = 1;

  bool remindersEnabled = true;
  bool detoxProgressEnabled = true;
  bool weeklyInsightsEnabled = true;
  int morningHour = 8;
  int morningMinute = 0;
  int eveningHour = 20;
  int eveningMinute = 0;

  Map<String, dynamic> toJson() => {
    'remindersEnabled': remindersEnabled,
    'detoxProgressEnabled': detoxProgressEnabled,
    'weeklyInsightsEnabled': weeklyInsightsEnabled,
    'morningHour': morningHour,
    'morningMinute': morningMinute,
    'eveningHour': eveningHour,
    'eveningMinute': eveningMinute,
  };
}

@collection
class MoodEntryRecord {
  Id id = Isar.autoIncrement;

  DateTime createdAt = DateTime.now();
  int score = 3;
  List<String> emotionTags = [];
  String note = '';
  int? manualScrollMinutes;

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'score': score,
    'emotionTags': emotionTags,
    'note': note,
    'manualScrollMinutes': manualScrollMinutes,
  };
}

@collection
class JournalEntryRecord {
  Id id = Isar.autoIncrement;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  String title = '';
  String body = '';
  String? promptId;
  String? promptCategory;
  int? moodEntryId;
  bool locked = false;

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'title': title,
    'body': body,
    'promptId': promptId,
    'promptCategory': promptCategory,
    'moodEntryId': moodEntryId,
    'locked': locked,
  };
}

@collection
class HabitRecord {
  Id id = Isar.autoIncrement;

  DateTime createdAt = DateTime.now();
  String name = '';
  String category = 'Study';
  String frequency = 'Daily';
  bool active = true;

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'name': name,
    'category': category,
    'frequency': frequency,
    'active': active,
  };
}

@collection
class HabitCompletionRecord {
  Id id = Isar.autoIncrement;

  int habitId = 0;
  DateTime day = DateTime.now();
  DateTime completedAt = DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'habitId': habitId,
    'day': day.toIso8601String(),
    'completedAt': completedAt.toIso8601String(),
  };
}

@collection
class DetoxSessionRecord {
  Id id = Isar.autoIncrement;

  String type = 'quick';
  int plannedMinutes = 10;
  DateTime startedAt = DateTime.now();
  DateTime? endedAt;
  String status = 'active';
  String replacementActivity = '';
  String reflectionNote = '';

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'plannedMinutes': plannedMinutes,
    'startedAt': startedAt.toIso8601String(),
    'endedAt': endedAt?.toIso8601String(),
    'status': status,
    'replacementActivity': replacementActivity,
    'reflectionNote': reflectionNote,
  };
}

@collection
class DetoxChallengeRecord {
  Id id = Isar.autoIncrement;

  String templateId = '';
  String name = '';
  int totalDays = 3;
  int completedDays = 0;
  bool active = true;
  DateTime startedAt = DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'templateId': templateId,
    'name': name,
    'totalDays': totalDays,
    'completedDays': completedDays,
    'active': active,
    'startedAt': startedAt.toIso8601String(),
  };
}

@collection
class PointsLedgerRecord {
  Id id = Isar.autoIncrement;

  DateTime createdAt = DateTime.now();
  String reason = '';
  int points = 0;

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'reason': reason,
    'points': points,
  };
}

@collection
class BadgeUnlockRecord {
  Id id = Isar.autoIncrement;

  String badgeId = '';
  String title = '';
  String description = '';
  DateTime unlockedAt = DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'badgeId': badgeId,
    'title': title,
    'description': description,
    'unlockedAt': unlockedAt.toIso8601String(),
  };
}

@collection
class AffirmationFavoriteRecord {
  Id id = Isar.autoIncrement;

  String affirmationId = '';
  DateTime createdAt = DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'affirmationId': affirmationId,
    'createdAt': createdAt.toIso8601String(),
  };
}
