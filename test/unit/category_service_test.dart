import 'package:flutter_test/flutter_test.dart';
import 'package:ai_email_sorter/features/categories/services/category_service.dart';
import 'package:ai_email_sorter/features/categories/models/email_category.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';
import 'package:isar/isar.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'dart:io';

import 'category_service_test.mocks.dart';

@GenerateMocks([IsarService])
void main() {
  late IsarService mockIsarService;
  late CategoryService categoryService;
  late Isar isar;
  late Directory tempDir;

  setUp(() async {
    mockIsarService = MockIsarService();
    categoryService = CategoryService(mockIsarService);
    
    // Create a temporary directory for Isar
    tempDir = await Directory.systemTemp.createTemp('test_isar_');
    
    // Set up a temporary Isar instance for testing
    isar = await Isar.open(
      [EmailCategorySchema, SortedEmailSchema],
      directory: tempDir.path,
    );
    when(mockIsarService.isar).thenReturn(isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    await tempDir.delete(recursive: true);
  });

  group('CategoryService', () {
    test('should create a new category', () async {
      const testName = 'Test Category';
      const testDescription = 'Test Description';

      final category = await categoryService.create(testName, testDescription);
      
      expect(category.name, equals(testName));
      expect(category.description, equals(testDescription));
      
      // Verify it was saved to Isar
      final savedCategory = await isar.emailCategorys.get(category.id);
      expect(savedCategory?.name, equals(testName));
      expect(savedCategory?.description, equals(testDescription));
    });

    test('should get all categories', () async {
      // Create test categories
      await categoryService.create('Category 1', 'Description 1');
      await categoryService.create('Category 2', 'Description 2');

      final categories = await categoryService.getAll();
      
      expect(categories.length, equals(2));
      expect(
        categories.map((c) => c.name).toList(),
        containsAll(['Category 1', 'Category 2'])
      );
    });

    test('should get category by id', () async {
      final category = await categoryService.create('Test', 'Description');
      
      final retrieved = await categoryService.getById(category.id);
      
      expect(retrieved?.name, equals('Test'));
      expect(retrieved?.description, equals('Description'));
    });

    test('should add email to category', () async {
      final category = await categoryService.create('Test', 'Description');
      final email = SortedEmail(
        emailId: 'test123',
        subject: 'Test Email',
        sender: 'test@example.com',
        receivedAt: DateTime.now(),
        summary: 'Test email summary',
      );

      await categoryService.addEmailToCategory(category, email);

      // Refresh the category from Isar to get the updated email links
      final updatedCategory = await isar.emailCategorys.get(category.id);
      expect(updatedCategory?.emailIds.length, equals(1));

      // Load the linked emails
      final linkedEmail = await isar.sortedEmails.get(email.id);
      expect(linkedEmail?.emailId, equals('test123'));
    });
  });
}