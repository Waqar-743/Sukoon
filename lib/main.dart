import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukoon/app/app.dart';
import 'package:sukoon/core/state/app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await SukoonStore.bootstrap();

  runApp(
    ProviderScope(
      overrides: [sukoonStoreProvider.overrideWith((ref) => store)],
      child: const SukoonApp(),
    ),
  );
}
