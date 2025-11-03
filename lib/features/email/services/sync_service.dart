import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/features/email/services/email_service.dart';

final syncServiceProvider = Provider((ref) => SyncService(ref));

class SyncService {
  final Ref _ref;
  SyncService(this._ref);

  /// Simulate a sync: fetch a few messages and import them via EmailService.
  Future<void> runSync() async {
    final emailSvc = _ref.read(emailServiceProvider);

    await emailSvc.importEmail(
      emailId: 'sync-1',
      subject: 'Promo: Black Friday Deals',
      sender: 'deals@shop.example',
      body: '<a href="https://shop.example/unsubscribe">unsubscribe</a> Great deals for you',
      receivedAt: DateTime.now().subtract(const Duration(hours: 6)),
    );

    await emailSvc.importEmail(
      emailId: 'sync-2',
      subject: 'Your receipt from GroceryMart',
      sender: 'receipts@grocery.example',
      body: 'Thanks for shopping. View your receipt online.',
      receivedAt: DateTime.now().subtract(const Duration(days: 2)),
    );
  }
}
