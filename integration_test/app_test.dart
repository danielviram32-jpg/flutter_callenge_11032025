import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ai_email_sorter/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Email Sorting Flow Test', () {
    testWidgets('Complete email sorting flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Step 1: Connect Gmail Account
      await tester.tap(find.byIcon(Icons.account_circle));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add Gmail Account'));
      await tester.pumpAndSettle();

      // Step 2: Create a new category
      await tester.tap(find.byIcon(Icons.category));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'Newsletters');
      await tester.enterText(find.byType(TextField).last, 'Email newsletters and updates');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify category was created
      expect(find.text('Newsletters'), findsOneWidget);

      // Step 3: Open category and check emails
      await tester.tap(find.text('Newsletters'));
      await tester.pumpAndSettle();

      // Verify empty state is shown initially
      expect(find.text('No emails in this category'), findsOneWidget);

      // Step 4: Trigger email sync (this would normally happen in background)
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // Verify loading state is shown during sync
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      // Step 5: Verify emails are categorized
      // Note: This depends on the mock data in the email service
      expect(find.byType(ListTile), findsWidgets);

      // Step 6: Test unsubscribe functionality
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Unsubscribe'));
      await tester.pumpAndSettle();

      // Verify unsubscribe confirmation
      expect(find.text('Successfully unsubscribed'), findsOneWidget);
    });
  });
}