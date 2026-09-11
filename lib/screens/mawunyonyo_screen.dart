import 'package:flutter/material.dart';
import '../widgets/language_toggle.dart';

class MawunyonyoScreen extends StatefulWidget {
  const MawunyonyoScreen({super.key});

  @override
  State<MawunyonyoScreen> createState() => _MawunyonyoScreenState();
}

class _MawunyonyoScreenState extends State<MawunyonyoScreen> {
  AppLanguage _language = AppLanguage.ewe;

  static const _eweText = '''
Oo Mawu, míeɖe kuku, na wò towo na nɔ ŋudzɔ eye wò ŋkuwo nenɔ ʋuʋu ɖewò dɔla kple wò amewo ƒe kokoƒoƒo na wò la ŋuti. 

Eye do du wò afɔwo kple wò asiwo ɖe wò xɔxɔdɔwo ta. Nye amesiwo siwo tso la, ƒe bebeƒe; elabena agakpe kple nuziɔɖeŋua nènye na ŋutilãwo.

 Oo Fofo mavɔmavɔ, Ŋusẽkatãtɔ, Mawu kalẽtɔ ,dzi kpe anygba wɔla, Kɔkɔetɔ, Dzɔdzɔetɔ, anukwaretɔ, se gbe sia, si dom míele ɖa na wò.

 Eye nave mía nu le nubabla, si me míegaɖo kpliwò le Kristo me la ta. 
Amen.''';

  static const _englishText = '''
O God, we entreat you, May your ears be attentive and your eyes alert, to the supplications of your Servant and your people. Make haste with your feet and hands for our salvation. Be a secret place of security for those who revere you. For you are a rock and shelter for all flesh.

O, Everlasting Father, Almighty God, Creator of heaven and the earth, Most Holy, Most Righteous and Most Truthful. Accept our prayers by the grace of our Lord Jesus Christ, And for the glory of the Covenant we have with you through Him.
Amen.
''';

  @override
  Widget build(BuildContext context) {
    final text = _language == AppLanguage.ewe ? _eweText : _englishText;

    return Scaffold(
      appBar: AppBar(title: const Text('Mawunyɔnyɔ')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LanguageToggle(
              selected: _language,
              onChanged: (lang) => setState(() => _language = lang),
            ),
            const SizedBox(height: 16),
            Text(text, style: const TextStyle(fontSize: 16, height: 1.6)),
          ],
        ),
      ),
    );
  }
}