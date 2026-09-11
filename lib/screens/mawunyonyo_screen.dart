import 'package:flutter/material.dart';

/// Placeholder screen for the "Mawunyonyo" drawer menu item.
/// Replace the body below with the actual content this section should show.
class MawunyonyoScreen extends StatelessWidget {
  const MawunyonyoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mawunyonyo')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          '''
Oo Mawu, míeɖe kuku, na wò towo na nɔ ŋudzɔ eye wò ŋkuwo nenɔ ʋuʋu ɖewò dɔla kple wò amewo ƒe kokoƒoƒo na wò la ŋuti.

Eye do du wò afɔwo kple wò asiwo ɖe wò xɔxɔdɔwo ta. Nye amesiwo siwo tso la, ƒe bebeƒe; elabena agakpe kple nuziɔɖeŋua nènye na ŋutilãwo.

 Oo Fofo mavɔmavɔ, Ŋusẽkatãtɔ, Mawu kalẽtɔ ,dzi kpe anygba wɔla, Kɔkɔetɔ, Dzɔdzɔetɔ, anukwaretɔ, se gbe sia, si dom míele ɖa na wò.

 Eye nave mía nu le nubabla, si me míegaɖo kpliwò le Kristo me la ta. 
Amen.


          ''',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}