import 'package:flutter/material.dart';

/// "Xɔsemeʋuʋu" (the Apostles' Creed in Ewe) — opened from the hamburger
/// drawer menu.
///
/// IMPORTANT: the text below covers the first two articles of the Creed
/// (belief in God the Father, and in Jesus Christ through his death,
/// burial and resurrection). It is very likely missing the third article
/// — belief in the Holy Spirit, the church, forgiveness of sins,
/// resurrection of the body, and life everlasting. Please verify and
/// complete this against your church's own authoritative Ewe text before
/// treating it as final.
class CreedScreen extends StatelessWidget {
  const CreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Xɔsemeʋuʋu')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
          '''
Mexɔ Mawu, etɔa ŋusẽ katã tɔ, si wɔ dzi kple anyigba dzi se.

Mexɔ Yesu Kristo, Mawu ƒe tenuvi ɖeka, si nye mía aƒetɔ dzi se, Ame si ƒe fu wofɔ tso Gbɔgbɔ Kɔkɔe la me, Eye Maria, dzetugbui la dzii, Ame si kpe fu le Pontio Pilato te, Eye wohee ɖe ati ŋu, eye wòku, eye woɖii; Ame si yi tsiẽƒe, Eye wòga fɔ tso amekukuwo dome le ŋkeke etɔ̃a gbe, Eye wòyi dziƒo, Eye wònɔ etɔa ŋusẽ katã tɔ ƒe nuɖusi me. Afima wòa ɖa tso ava drɔ̃ ʋɔnu na amegbagbewo kple amekukuwo.

''',
          style: TextStyle(fontSize: 16, height: 1.6),
        ),
      ),
    );
  }
}