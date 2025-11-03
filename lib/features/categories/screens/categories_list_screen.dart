import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/features/categories/services/category_service.dart';
import 'package:ai_email_sorter/features/categories/screens/add_category_screen.dart';
import 'package:ai_email_sorter/features/email/services/email_service.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_email_sorter/features/email/services/sync_service.dart';

class CategoriesListScreen extends ConsumerStatefulWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends ConsumerState<CategoriesListScreen> {
  bool _importing = false;

  @override
  void initState() {
    super.initState();
    // Run a background sync stub when opening the screen
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() => _importing = true);
      await ref.read(syncServiceProvider).runSync();
      setState(() => _importing = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sync complete (stub)')));
        setState(() {});
      }
    });
  }

  Future<void> _importSamples() async {
    setState(() => _importing = true);
    final emailSvc = ref.read(emailServiceProvider);

    // three sample emails
    await emailSvc.importEmail(
      emailId: 'msg-1',
      subject: 'Welcome to Acme Promotions',
      sender: 'promo@acme.example',
      body: 'Huge discounts on Acme products. Click to save 50%!',
      receivedAt: DateTime.now().subtract(const Duration(hours: 2)),
    );

    await emailSvc.importEmail(
      emailId: 'msg-2',
      subject: 'Your invoice from Cloudify',
      sender: 'billing@cloudify.example',
      body: 'Attached is your invoice for last month. Please review the charges.',
      receivedAt: DateTime.now().subtract(const Duration(days: 1)),
    );

    await emailSvc.importEmail(
      emailId: 'msg-3',
      subject: 'Weekly newsletter — Tech Trends',
      sender: 'news@techtrends.example',
      body: 'This week in tech: AI is reshaping the industry. Subscribe for more updates.',
      receivedAt: DateTime.now().subtract(const Duration(days: 3)),
    );

    setState(() => _importing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final created = await Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AddCategoryScreen(),
              ));
              if (created == true) {
                setState(() {});
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              context.go('/accounts');
            },
            tooltip: 'Connected Accounts',
          ),
          IconButton(
            icon: _importing ? const CircularProgressIndicator(color: Colors.white) : const Icon(Icons.download),
            onPressed: _importing ? null : () async {
              await _importSamples();
              setState(() {});
            },
            tooltip: 'Import sample emails',
          ),
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () async {
              setState(() => _importing = true);
              await ref.read(syncServiceProvider).runSync();
              setState(() => _importing = false);
            },
            tooltip: 'Sync (stub) Gmail accounts',
          ),
        ],
      ),
      body: FutureBuilder(
        future: ref.read(categoryServiceProvider).getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final List categories = snapshot.data as List? ?? [];
          if (categories.isEmpty) {
            return const Center(child: Text('No categories yet'));
          }
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return ListTile(
                title: Text(cat.name),
                subtitle: Text(cat.description),
                onTap: () {
                  context.go('/category/${cat.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
