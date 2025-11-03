import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_email_sorter/features/auth/screens/login_screen.dart';
import 'package:ai_email_sorter/features/home/screens/home_screen.dart';
import 'package:ai_email_sorter/features/categories/screens/categories_list_screen.dart';
import 'package:ai_email_sorter/features/categories/screens/category_detail_screen.dart';
import 'package:ai_email_sorter/features/accounts/screens/connected_accounts_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const CategoriesListScreen(),
      ),
      GoRoute(
        path: '/category/:id',
        builder: (context, state) {
          final idStr = state.pathParameters['id'];
          final id = idStr != null ? int.tryParse(idStr) ?? 0 : 0;
          return CategoryDetailScreen(categoryId: id);
        },
      ),
      GoRoute(
        path: '/accounts',
        builder: (context, state) => const ConnectedAccountsScreen(),
      ),
    ],
  );
});