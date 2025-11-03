import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ai_email_sorter/features/email/services/email_service.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';
import 'package:isar/isar.dart';
import 'dart:io';

import 'email_service_test.mocks.dart';

@GenerateMocks([IsarService])
void main() {
  late IsarService mockIsarService;
  late EmailService emailService;
  late Isar isar;
  late Directory tempDir;

  setUp(() async {
    mockIsarService = MockIsarService();
    emailService = EmailService(mockIsarService);
    
    // Create a temporary directory for Isar
    tempDir = await Directory.systemTemp.createTemp('test_isar_');
    
    // Set up a temporary Isar instance for testing
    isar = await Isar.open(
      [SortedEmailSchema],
      directory: tempDir.path,
    );
    when(mockIsarService.isar).thenReturn(isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    await tempDir.delete(recursive: true);
  });

  group('EmailService', () {
    test('should store new email', () async {
      final email = SortedEmail(
        emailId: 'test123',
        subject: 'Test Email',
        sender: 'test@example.com',
        receivedAt: DateTime.now(),
        summary: 'Test email summary',
      );

      await emailService.storeEmail(email);
      
      final savedEmail = await isar.sortedEmails.get(email.id);
      expect(savedEmail?.emailId, equals('test123'));
      expect(savedEmail?.subject, equals('Test Email'));
      expect(savedEmail?.sender, equals('test@example.com'));
    });

    test('should mark email as read', () async {
      final email = SortedEmail(
        emailId: 'test123',
        subject: 'Test Email',
        sender: 'test@example.com',
        receivedAt: DateTime.now(),
        summary: 'Test email summary',
      );

      await emailService.storeEmail(email);
      await emailService.markEmailAsRead(email.id);
      
      final updatedEmail = await isar.sortedEmails.get(email.id);
      expect(updatedEmail?.isRead, isTrue);
    });

    test('should get emails by time range', () async {
      final now = DateTime.now();
      final emails = [
        SortedEmail(
          emailId: 'old',
          subject: 'Old Email',
          sender: 'test@example.com',
          receivedAt: now.subtract(Duration(days: 10)),
          summary: 'Old email',
        ),
        SortedEmail(
          emailId: 'recent',
          subject: 'Recent Email',
          sender: 'test@example.com',
          receivedAt: now.subtract(Duration(hours: 1)),
          summary: 'Recent email',
        ),
      ];

      for (var email in emails) {
        await emailService.storeEmail(email);
      }

      final recentEmails = await emailService.getEmailsByTimeRange(
        start: now.subtract(Duration(days: 1)),
        end: now,
      );

      expect(recentEmails.length, equals(1));
      expect(recentEmails.first.emailId, equals('recent'));
    });

    test('should extract unsubscribe link', () async {
      final email = SortedEmail(
        emailId: 'test123',
        subject: 'Newsletter',
        sender: 'newsletter@example.com',
        receivedAt: DateTime.now(),
        summary: 'Newsletter content with unsubscribe link',
        unsubscribeLink: 'https://example.com/unsubscribe?id=123',
      );

      await emailService.storeEmail(email);
      final link = await emailService.getUnsubscribeLink(email.id);
      
      expect(link, equals('https://example.com/unsubscribe?id=123'));
    });
  });
}