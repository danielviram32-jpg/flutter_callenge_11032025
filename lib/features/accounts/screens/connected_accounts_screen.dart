import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_email_sorter/features/accounts/services/connected_accounts_service.dart';
import 'package:ai_email_sorter/features/accounts/models/connected_account.dart';
import 'package:uuid/uuid.dart';

class ConnectedAccountsScreen extends ConsumerStatefulWidget {
  const ConnectedAccountsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConnectedAccountsScreen> createState() => _ConnectedAccountsScreenState();
}

class _ConnectedAccountsScreenState extends ConsumerState<ConnectedAccountsScreen> {
  List<ConnectedAccount> _accounts = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final svc = ref.read(connectedAccountsServiceProvider);
    final all = await svc.getAll();
    setState(() {
      _accounts = all;
      _loading = false;
    });
  }

  Future<void> _addMockAccount() async {
    final id = const Uuid().v4();
    final acct = ConnectedAccount(id: id, email: 'user+\$id@example.com', displayName: 'Mock User');
    await ref.read(connectedAccountsServiceProvider).add(acct);
    await _load();
  }

  Future<void> _remove(String id) async {
    await ref.read(connectedAccountsServiceProvider).remove(id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connected Accounts')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _accounts.length,
                    itemBuilder: (context, index) {
                      final a = _accounts[index];
                      return ListTile(
                        title: Text(a.email),
                        subtitle: Text(a.displayName),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => _remove(a.id),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _addMockAccount,
                          child: const Text('Add Mock Gmail Account'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
