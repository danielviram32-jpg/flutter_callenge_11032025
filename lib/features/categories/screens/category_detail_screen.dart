import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/features/categories/services/category_service.dart';
import 'package:ai_email_sorter/core/services/isar_service.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';
import 'package:ai_email_sorter/features/email/services/unsubscribe_service.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  final int categoryId;
  const CategoryDetailScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  ConsumerState<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
  List<SortedEmail> _emails = [];
  Set<int> _selected = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final catSvc = ref.read(categoryServiceProvider);
    final cat = await catSvc.getById(widget.categoryId);
    if (cat == null) {
      setState(() {
        _emails = [];
        _loading = false;
      });
      return;
    }
    await cat.emailIds.load();
    setState(() {
      _emails = List<SortedEmail>.from(cat.emailIds);
      _loading = false;
    });
  }

  Future<void> _deleteSelected() async {
    final isar = ref.read(isarServiceProvider).isar;
    if (isar == null) return;
    await isar.writeTxn(() async {
      for (final idx in _selected) {
        final e = _emails[idx];
        await isar.sortedEmails.delete(e.id);
      }
    });
    await _load();
    setState(() => _selected.clear());
  }

  Future<void> _unsubscribeSelected() async {
    final svc = ref.read(unsubscribeServiceProvider);
    for (final idx in _selected) {
      final e = _emails[idx];
      if (e.unsubscribeLink != null) {
        await svc.performUnsubscribe(e);
      }
    }
    await _load();
    setState(() => _selected.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category ${widget.categoryId}'),
        actions: [
          if (_selected.isNotEmpty) ...[
            IconButton(onPressed: _deleteSelected, icon: const Icon(Icons.delete)),
            IconButton(onPressed: _unsubscribeSelected, icon: const Icon(Icons.link_off)),
          ]
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _emails.length,
              itemBuilder: (context, index) {
                final e = _emails[index];
                final selected = _selected.contains(index);
                return ListTile(
                  leading: Checkbox(
                    value: selected,
                    onChanged: (v) {
                      setState(() {
                        if (v == true) _selected.add(index); else _selected.remove(index);
                      });
                    },
                  ),
                  title: Text(e.subject),
                  subtitle: Text(e.summary),
                  onTap: () {
                    // Show full email content in dialog
                    showDialog(context: context, builder: (_) {
                      return AlertDialog(
                        title: Text(e.subject),
                        content: SingleChildScrollView(child: Text('From: ${e.sender}\n\n${e.summary}')),
                        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
                      );
                    });
                  },
                );
              },
            ),
    );
  }
}
