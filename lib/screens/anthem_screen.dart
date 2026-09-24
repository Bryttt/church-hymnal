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
/: Agoo na nyigba:|
Mawu ƒe gbe ɖi le yame be
Mihɔ ketɔ la ƒe nuwo ɖa
Mihɔ ketɔ la ƒe nuwo ɖa
|:Dzitɔ xɔ 'ƒe fiaduƒe la
Nusianu nezi ɖodoe:|''',
          style: TextStyle(fontSize: 16, height: 1.6),
        ),
      ),
    );
  }
}