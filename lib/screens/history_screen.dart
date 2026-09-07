import 'package:flutter/material.dart';

/// Placeholder screen for the "Brief History about the ARS Church and its
/// founder" drawer menu item. Replace the body text below with the real
/// history content.
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About ARS Church')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'A brief history of the ARS Church and its founder goes here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
