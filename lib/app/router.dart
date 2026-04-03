import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/features/calm/presentation/calm_screens.dart';
import 'package:sukoon/features/community/presentation/community_screens.dart';
import 'package:sukoon/features/detox/presentation/detox_screens.dart';
import 'package:sukoon/features/goals/presentation/goals_screens.dart';
import 'package:sukoon/features/home/presentation/home_screen.dart';
import 'package:sukoon/features/journal/presentation/journal_screens.dart';
import 'package:sukoon/features/mood/presentation/mood_screens.dart';
import 'package:sukoon/features/onboarding/presentation/onboarding_screens.dart';
import 'package:sukoon/features/settings/presentation/settings_screen.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final store = ref.watch(sukoonStoreProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: store,
    redirect: (context, state) {
      if (!store.isReady && state.matchedLocation != '/splash') {
        return '/splash';
      }

      final isOnboarding = state.matchedLocation.startsWith('/onboarding');
      final isStart = state.matchedLocation == '/start';
      if (store.isReady &&
          !store.onboardingComplete &&
          !isOnboarding &&
          !isStart &&
          state.matchedLocation != '/splash') {
        return '/start';
      }

      if (store.isReady &&
          store.onboardingComplete &&
          (state.matchedLocation == '/splash' ||
              state.matchedLocation == '/start' ||
              isOnboarding)) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/start', builder: (context, state) => const StartScreen()),
      GoRoute(
        path: '/onboarding/profile',
        builder: (context, state) => const ProfileOnboardingScreen(),
      ),
      GoRoute(
        path: '/onboarding/triggers',
        builder: (context, state) => const TriggerOnboardingScreen(),
      ),
      GoRoute(
        path: '/onboarding/notifications',
        builder: (context, state) => const NotificationOnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return SukoonShell(currentLocation: state.uri.path, child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/mood/checkin',
            builder: (context, state) => const MoodCheckinScreen(),
          ),
          GoRoute(
            path: '/journal',
            builder: (context, state) => const JournalHomeScreen(),
          ),
          GoRoute(
            path: '/goals',
            builder: (context, state) => const GoalsScreen(),
          ),
          GoRoute(
            path: '/detox',
            builder: (context, state) => const DetoxDashboardScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/home/emergency-kit',
        builder: (context, state) => const EmergencyKitScreen(),
      ),
      GoRoute(
        path: '/mood/history',
        builder: (context, state) => const MoodHistoryScreen(),
      ),
      GoRoute(
        path: '/mood/insights',
        builder: (context, state) => const MoodInsightsScreen(),
      ),
      GoRoute(path: '/calm', builder: (context, state) => const CalmScreen()),
      GoRoute(
        path: '/calm/breathing/:type',
        builder: (context, state) =>
            BreathingScreen(type: state.pathParameters['type'] ?? 'box'),
      ),
      GoRoute(
        path: '/calm/grounding',
        builder: (context, state) => const GroundingScreen(),
      ),
      GoRoute(
        path: '/calm/affirmations',
        builder: (context, state) => const AffirmationsScreen(),
      ),
      GoRoute(
        path: '/journal/editor/new',
        builder: (context, state) => JournalEditorScreen(
          promptId: state.uri.queryParameters['promptId'],
        ),
      ),
      GoRoute(
        path: '/journal/editor/:id',
        builder: (context, state) => JournalEditorScreen(
          entryId: int.tryParse(state.pathParameters['id'] ?? ''),
        ),
      ),
      GoRoute(
        path: '/journal/entry/:id',
        builder: (context, state) => JournalEntryScreen(
          entryId: int.tryParse(state.pathParameters['id'] ?? '') ?? -1,
        ),
      ),
      GoRoute(
        path: '/goals/habit/edit',
        builder: (context, state) => const HabitEditScreen(),
      ),
      GoRoute(
        path: '/goals/habit/edit/:id',
        builder: (context, state) => HabitEditScreen(
          habitId: int.tryParse(state.pathParameters['id'] ?? ''),
        ),
      ),
      GoRoute(
        path: '/goals/history',
        builder: (context, state) => const GoalsHistoryScreen(),
      ),
      GoRoute(
        path: '/detox/challenge',
        builder: (context, state) => const DetoxChallengeScreen(),
      ),
      GoRoute(
        path: '/detox/stats',
        builder: (context, state) => const DetoxStatsScreen(),
      ),
      GoRoute(
        path: '/detox/session/:type',
        builder: (context, state) =>
            DetoxSessionScreen(type: state.pathParameters['type'] ?? 'quick'),
      ),
      GoRoute(
        path: '/community',
        builder: (context, state) => const CommunityScreen(),
      ),
      GoRoute(
        path: '/community/compose',
        builder: (context, state) => const CommunityComposeScreen(),
      ),
      GoRoute(
        path: '/community/library',
        builder: (context, state) => const CommunityLibraryScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});
