import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ai_email_sorter/features/categories/models/email_category.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isarServiceProvider = Provider<IsarService>((ref) => IsarService());

class IsarService {
  Isar? _isar;

  Isar? get isar => _isar;

  Future<void> init() async {
    if (_isar != null) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      EmailCategorySchema,
      SortedEmailSchema,
    ], directory: dir.path);
    if (!kIsWeb) {
      // nothing extra
    }
  }

  Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
