import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';

final unsubscribeServiceProvider = Provider((ref) => UnsubscribeService(ref));

class UnsubscribeService {
  final Ref _ref;
  UnsubscribeService(this._ref);

  /// Simulate visiting the unsubscribe link and performing the action.
  /// Returns true if the service believes it succeeded.
  Future<bool> performUnsubscribe(SortedEmail email) async {
    final isar = _ref.read(isarServiceProvider).isar;
    if (isar == null) return false;
    if (email.unsubscribeLink == null) return false;

    // Simulate network/form interaction delay
    await Future.delayed(const Duration(seconds: 1));

    // In this stub, we simply clear the unsubscribeLink and save the email to mark it done
    email.unsubscribeLink = null;
    await isar.writeTxn(() async {
      await isar.sortedEmails.put(email);
    });

    return true;
  }
}
