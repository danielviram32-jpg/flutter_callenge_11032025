import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_email_sorter/features/accounts/models/connected_account.dart';

final connectedAccountsServiceProvider = Provider((ref) => ConnectedAccountsService());

class ConnectedAccountsService {
  static const _key = 'connected_accounts_v1';

  Future<List<ConnectedAccount>> getAll() async {
    final sp = await SharedPreferences.getInstance();
    final data = sp.getString(_key);
    if (data == null) return [];
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => ConnectedAccount.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> add(ConnectedAccount account) async {
    final sp = await SharedPreferences.getInstance();
    final current = await getAll();
    current.add(account);
    await sp.setString(_key, json.encode(current.map((e) => e.toJson()).toList()));
  }

  Future<void> remove(String id) async {
    final sp = await SharedPreferences.getInstance();
    final current = await getAll();
    current.removeWhere((e) => e.id == id);
    await sp.setString(_key, json.encode(current.map((e) => e.toJson()).toList()));
  }
}
