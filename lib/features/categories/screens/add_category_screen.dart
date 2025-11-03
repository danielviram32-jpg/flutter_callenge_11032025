import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/features/categories/services/category_service.dart';

class AddCategoryScreen extends ConsumerStatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends ConsumerState<AddCategoryScreen> {
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Category')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 12),
            TextField(controller: _descCtrl, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : () async {
                setState(() => _loading = true);
                try {
                  await ref.read(categoryServiceProvider).create(_nameCtrl.text.trim(), _descCtrl.text.trim());
                  Navigator.of(context).pop(true);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to create category')));
                } finally {
                  setState(() => _loading = false);
                }
              },
              child: _loading ? const CircularProgressIndicator() : const Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
