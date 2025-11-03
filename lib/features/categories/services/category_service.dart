import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';
import 'package:isar/isar.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';
import 'package:ai_email_sorter/features/categories/models/email_category.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  final isarSvc = ref.read(isarServiceProvider);
  return CategoryService(isarSvc);
});

class CategoryService {
  final IsarService _isarService;
  CategoryService(this._isarService);

  Future<List<EmailCategory>> getAll() async {
    final isar = _isarService.isar;
    if (isar == null) return [];
    return await isar.emailCategorys.where().findAll();
  }

  Future<EmailCategory?> getById(int id) async {
    final isar = _isarService.isar;
    if (isar == null) return null;
    return await isar.emailCategorys.get(id);
  }

  Future<void> addEmailToCategory(EmailCategory category, SortedEmail email) async {
    final isar = _isarService.isar;
    if (isar == null) throw Exception('Isar not initialized');
    await isar.writeTxn(() async {
      final eid = await isar.sortedEmails.put(email);
      email.id = eid;
      category.emailIds.add(email);
      await isar.emailCategorys.put(category);
    });
  }

  Future<EmailCategory> create(String name, String description) async {
    final isar = _isarService.isar;
    if (isar == null) throw Exception('Isar not initialized');
    final cat = EmailCategory(name: name, description: description);
    final id = await isar.writeTxn(() async {
      return await isar.emailCategorys.put(cat);
    });
    cat.id = id;
    return cat;
  }
}
