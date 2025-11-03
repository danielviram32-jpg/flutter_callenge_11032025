import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/core/constants.dart';
import 'package:ai_email_sorter/core/router.dart';
import 'package:ai_email_sorter/core/theme.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar before running the app and provide it via ProviderScope
  final isarService = await _initIsarService();

  runApp(ProviderScope(overrides: [
    isarServiceProvider.overrideWithValue(isarService),
  ], child: const MyApp()));
}

// Helper to initialize IsarService
Future<IsarService> _initIsarService() async {
  final svc = IsarService();
  await svc.init();
  return svc;
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
