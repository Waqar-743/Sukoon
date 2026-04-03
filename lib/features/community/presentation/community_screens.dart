import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sukoon/core/content/app_content.dart';
import 'package:sukoon/core/state/app_state.dart';
import 'package:sukoon/shared/widgets/common_widgets.dart';

class CommunityScreen extends ConsumerWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Community', 'Community')),
        actions: [
          IconButton(
            onPressed: () => context.push('/community/compose'),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: FutureBuilder<bool>(
        future: ref.read(sukoonStoreProvider).checkCommunityConnectivity(),
        builder: (context, snapshot) {
          final online = snapshot.data ?? false;
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SukoonSectionCard(
                title: store.tr('Anonymous by default', 'By default anonymous'),
                subtitle: online
                    ? store.tr(
                        'Cloud moderation is not configured in this private build yet.',
                        'Is private build mein cloud moderation abhi configure nahin hui.',
                      )
                    : store.tr(
                        'You are offline. Community posting stays disabled until a moderated backend is configured.',
                        'Aap offline hain. Moderated backend ke baghair community posting disabled rehti hai.',
                      ),
                trailing: FilledButton.tonal(
                  onPressed: () => context.push('/community/library'),
                  child: Text(store.tr('Library', 'Library')),
                ),
                child: Text(
                  store.tr(
                    'This screen uses a local preview timeline so the product flow is complete without pretending a live community exists.',
                    'Yeh screen local preview timeline use karti hai taa-ke product flow mukammal ho bina yeh dikhaye ke live community tayari mein hai.',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              for (final post in store.communityPosts)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SukoonSectionCard(
                    title: post.alias,
                    subtitle:
                        '${DateFormat.yMMMd().add_jm().format(post.createdAt)}${post.localOnly ? ' · Local preview' : ''}',
                    child: Text(post.body),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class CommunityComposeScreen extends ConsumerStatefulWidget {
  const CommunityComposeScreen({super.key});

  @override
  ConsumerState<CommunityComposeScreen> createState() =>
      _CommunityComposeScreenState();
}

class _CommunityComposeScreenState
    extends ConsumerState<CommunityComposeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Compose anonymously', 'Anonymous compose')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SukoonSectionCard(
            title: store.tr('Safety first', 'Safety pehle'),
            subtitle: store.tr(
              'Short posts, no vanity metrics, no public ranking.',
              'Short posts, vanity metrics nahin, public ranking nahin.',
            ),
            child: TextField(
              controller: _controller,
              maxLines: 6,
              maxLength: 240,
              decoration: InputDecoration(
                labelText: store.tr(
                  'What would you like to share?',
                  'Kya share karna chahte ho?',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () async {
              final text = _controller.text.trim();
              if (store.containsCrisisKeyword(text)) {
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      store.tr(
                        'Pause before posting',
                        'Post karne se pehle ruk jao',
                      ),
                    ),
                    content: Text(store.pick(AppContent.emergencyContacts)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return;
              }
              final success = await ref
                  .read(sukoonStoreProvider)
                  .saveCommunityPreviewPost(text);
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    success
                        ? store.tr(
                            'Saved to the local preview queue.',
                            'Local preview queue mein save ho gaya.',
                          )
                        : store.tr(
                            'Please wait before posting again.',
                            'Dobara post karne se pehle thora ruk jao.',
                          ),
                  ),
                ),
              );
              if (success) context.go('/community');
            },
            child: Text(
              store.tr('Save preview post', 'Preview post save karo'),
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityLibraryScreen extends ConsumerWidget {
  const CommunityLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(sukoonStoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(store.tr('Community library', 'Community library')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final article in AppContent.communityArticles)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SukoonSectionCard(
                title: store.pick(article.title),
                subtitle: store.pick(article.summary),
                child: Text(store.pick(article.body)),
              ),
            ),
        ],
      ),
    );
  }
}
