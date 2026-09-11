import 'package:flutter/material.dart';

/// "ARS Anthem" — opened from the hamburger drawer menu.
/// Replace the body below with the actual anthem lyrics.
class AnthemScreen extends StatelessWidget {
  const AnthemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ARS Anthem')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
          '''
The ARS Anthem lyrics go here.
''',
          style: TextStyle(fontSize: 16, height: 1.6),
        ),
      ),
    );
  }
}