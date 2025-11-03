import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/features/accounts/screens/connected_accounts_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  testWidgets('ConnectedAccountsScreen shows add account button', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ConnectedAccountsScreen(),
        ),
      ),
    );

    // Verify that the add account button is present
    expect(find.text('Add Gmail Account'), findsOneWidget);
  });

  testWidgets('ConnectedAccountsScreen shows empty state when no accounts', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ConnectedAccountsScreen(),
        ),
      ),
    );

    // Verify that the empty state message is shown
    expect(find.text('No email accounts connected'), findsOneWidget);
  });

  testWidgets('ConnectedAccountsScreen shows connected accounts', (WidgetTester tester) async {
    // Add a mock account
    await prefs.setStringList('connected_accounts', ['test@gmail.com']);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ConnectedAccountsScreen(),
        ),
      ),
    );

    // Verify that the account email is shown
    expect(find.text('test@gmail.com'), findsOneWidget);
  });

  testWidgets('Can remove connected account', (WidgetTester tester) async {
    // Add a mock account
    await prefs.setStringList('connected_accounts', ['test@gmail.com']);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ConnectedAccountsScreen(),
        ),
      ),
    );

    // Find and tap the remove button
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Verify the account is removed
    expect(find.text('test@gmail.com'), findsNothing);
    expect(find.text('No email accounts connected'), findsOneWidget);
  });
}