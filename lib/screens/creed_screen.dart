import 'package:flutter/material.dart';
import '../widgets/language_toggle.dart';

/// "Xɔsemeʋuʋu" (the Apostles' Creed) — opened from the hamburger drawer
/// menu. Toggle between the Ewe and English versions.
///
/// IMPORTANT: the Ewe text covers the first two articles of the Creed
/// (belief in God the Father, and in Jesus Christ through his death,
/// burial and resurrection). It is very likely missing the third article
/// — belief in the Holy Spirit, the church, forgiveness of sins,
/// resurrection of the body, and life everlasting. Please verify and
/// complete this against your church's own authoritative Ewe text before
/// treating it as final. The English version below is the standard
/// ecumenical English text and is complete.
class CreedScreen extends StatefulWidget {
  const CreedScreen({super.key});

  @override
  State<CreedScreen> createState() => _CreedScreenState();
}

class _CreedScreenState extends State<CreedScreen> {
  AppLanguage _language = AppLanguage.ewe;

  static const _eweText = '''
Mexɔ Mawu, etɔa ŋusẽ katã tɔ, si wɔ dzi kple anyigba dzi se.

Mexɔ Yesu Kristo, Mawu ƒe tenuvi ɖeka, si nye mía aƒetɔ dzi se, Ame si ƒe fu wofɔ tso Gbɔgbɔ Kɔkɔe la me, Eye Maria, dzetugbui la dzii, Ame si kpe fu le Pontio Pilato te, Eye wohee ɖe ati ŋu, eye wòku, eye woɖii; Ame si yi tsiẽƒe, Eye wòga fɔ tso amekukuwo dome le ŋkeke etɔ̃a gbe, Eye wòyi dziƒo, Eye wònɔ etɔa ŋusẽ katã tɔ ƒe nuɖusi me. Afima wòa ɖa tso ava drɔ̃ ʋɔnu na amegbagbewo kple amekukuwo.

[The remaining portion — belief in the Holy Spirit, the holy church, the communion of saints, forgiveness of sins, the resurrection of the body, and life everlasting — needs to be added here from your church's own text.]
''';

  static const _englishText = '''
I believe in God, the Father almighty, creator of heaven and earth.

I believe in Jesus Christ, God's only Son, our Lord. He was conceived by the power of the Holy Spirit and born of the virgin Mary. He suffered under Pontius Pilate, was crucified, died, and was buried. He descended to the dead. On the third day he rose again. He ascended into heaven and is seated at the right hand of the Father. He will come again to judge the living and the dead.

I believe in the Holy Spirit, the holy catholic church, the communion of saints, the forgiveness of sins, the resurrection of the body, and the life everlasting. Amen.
''';

  @override
  Widget build(BuildContext context) {
    final text = _language == AppLanguage.ewe ? _eweText : _englishText;

    return Scaffold(
      appBar: AppBar(title: const Text('Xɔsemeʋuʋu')),
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