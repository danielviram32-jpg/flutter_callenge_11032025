import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Email Sorter'),
      ),
      body: const Center(
        child: Text('Home - connect accounts, categories, and emails will appear here'),
      ),
    );
  }
}