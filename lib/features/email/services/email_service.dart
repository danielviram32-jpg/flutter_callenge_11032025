import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';
import 'package:ai_email_sorter/features/categories/services/category_service.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';
import 'package:ai_email_sorter/features/categories/models/email_category.dart';

final emailServiceProvider = Provider((ref) => EmailService(ref));

class EmailService {
  final Ref _ref;
  EmailService(this._ref);

  // Very small placeholder "AI" summarizer - grabs first 120 chars
  String summarize(String body) {
    final clean = body.replaceAll('\n', ' ').trim();
    if (clean.length <= 120) return clean;
    return '${clean.substring(0, 117)}...';
  }

  // Simple categorizer stub: picks the first category that matches a keyword from subject/body
  Future<EmailCategory?> pickCategoryForContent(String subject, String body) async {
  final catService = _ref.read(categoryServiceProvider);
  final cats = await catService.getAll();
    final text = '${subject.toLowerCase()} ${body.toLowerCase()}';
    for (final c in cats) {
      final desc = c.description.toLowerCase();
      for (final part in desc.split(RegExp(r'[,;\s]+'))) {
        if (part.isEmpty) continue;
        if (text.contains(part)) return c;
      }
    }
    // fallback to first category if exists
    return cats.isNotEmpty ? cats.first : null;
  }

  // Import a single email (stub). In a real app you'd pass Gmail message data.
  Future<void> importEmail({
    required String emailId,
    required String subject,
    required String sender,
    required String body,
    required DateTime receivedAt,
  }) async {
  final isarSvc = _ref.read(isarServiceProvider);
  final catService = _ref.read(categoryServiceProvider);

    final summary = summarize(body);

    final chosen = await pickCategoryForContent(subject, body);

    // Try to extract a simple unsubscribe link from the body
    final unsubMatch = RegExp(r'href=[^\s>]*unsubscribe[^\s>]*', caseSensitive: false).firstMatch(body);
    String? unsubLink;
    if (unsubMatch != null) {
    var s = unsubMatch.group(0)!;
    s = s.replaceFirst('href=', '');
    s = s.replaceAll('"', '').replaceAll("'", '');
    unsubLink = s;
    } else if (body.toLowerCase().contains('unsubscribe')) {
      unsubLink = 'https://example.com/unsubscribe';
    } else {
      unsubLink = null;
    }

    final email = SortedEmail(
      emailId: emailId,
      subject: subject,
      sender: sender,
      receivedAt: receivedAt,
      summary: summary,
      unsubscribeLink: unsubLink,
    );

    if (chosen != null) {
      await catService.addEmailToCategory(chosen, email);
    } else {
      // If no category exists, create a simple default category then add
      final defaultCat = await catService.create('Inbox', 'Default inbox');
      await catService.addEmailToCategory(defaultCat, email);
    }

    // In a real implementation we'd call Gmail API to archive the message here.
  }
}
