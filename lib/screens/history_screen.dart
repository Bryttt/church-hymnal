import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// "Brief History about the ARS Church and its founder" — opened from the
/// hamburger drawer menu.
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(fontSize: 16, height: 1.6, color: Colors.white);
    const boldStyle = TextStyle(fontSize: 16, height: 1.6, fontWeight: FontWeight.bold, color: Colors.white);
    const boldItalicStyle = TextStyle(
      fontSize: 16,
      height: 1.6,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Colors.white,
    );
    const sectionTitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('About ARS Church')),
      // Background set to the brand color so white text stays readable
      // — plain white text on the app's default white background would
      // otherwise be invisible.
      backgroundColor: AppColors.brandRed,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Founder section (placed before the church history) ──
            const Text('About the Founder', style: sectionTitleStyle),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                style: baseStyle,
                children: [
                  const TextSpan(text: 'Prophet '),
                  const TextSpan(
                    text: 'Charles Kwabla Nutornti Wovenu',
                    style: boldItalicStyle,
                  ),
                  const TextSpan(
                    text:
                        ' was born in ',
                  ),
                  const TextSpan(text: '1918', style: boldItalicStyle),
                  const TextSpan(
                    text:
                        ' in Anyako, in the Volta Region of Ghana, to '
                        'traditionalist parents. He was baptized as a child and went on '
                        'to work as a teacher before joining the Gold Coast Prison '
                        'Service, and later taking up work at a mining company in '
                        'Akwatia.\n\n'
                        'While working at the mines, he began experiencing a spiritual '
                        'calling that compelled him to sing, preach, and pray. He formed '
                        'choirs and prayer cells, and chose to give up his income and '
                        'possessions rather than abandon this calling. He returned to '
                        'the Volta Region in ',
                  ),
                  const TextSpan(text: '1939', style: boldItalicStyle),
                  const TextSpan(
                    text:
                        ', settling in Tadzewu, where he established a school and a '
                        'prayer group. A revelation he received some years later led '
                        'him to found the Apostles Revelation Society, and to adopt '
                        'the name Wovenu — meaning "one who has received grace." He '
                        'became widely known by the Ewe title Mawu Fe Ame, or "Man of '
                        'God," and was recognized for his gifts of prophecy and '
                        'healing throughout his decades of ministry, which included '
                        'establishing branches of the church across several countries.\n\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ── Church history section ──
            const Text('History of the Church', style: sectionTitleStyle),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                style: baseStyle,
                children: [
                  const TextSpan(
                    text: 'The Apostles Revelation Society (ARS) was founded in ',
                  ),
                  const TextSpan(text: '1939', style: boldItalicStyle),
                  const TextSpan(text: ' by '),
                  const TextSpan(
                    text: 'Prophet Charles Kwabla Nutornti Wovenu',
                    style: boldItalicStyle,
                  ),
                  const TextSpan(
                    text:
                        ' in Tadzewu, in the Volta Region of present-day Ghana. '
                        'It stands as a pioneering institution in the history of '
                        'African Independent Churches.\n\n',
                  ),
                  const TextSpan(text: 'The Foundation (', style: boldStyle),
                  const TextSpan(text: '1939', style: boldItalicStyle),
                  const TextSpan(text: '):', style: boldStyle),
                  const TextSpan(
                    text:
                        ' Wovenu established the church as a direct response to '
                        'orthodox Western missionary Christianity, focusing on '
                        'spiritual healing, prophecy, and local empowerment.\n\n',
                  ),
                  const TextSpan(text: 'Cultural Integration:', style: boldStyle),
                  const TextSpan(
                    text:
                        ' Unlike European missions that often banned local customs, '
                        'ARS actively integrated Ewe cultural elements into Christian '
                        'worship. It legitimized indigenous drumming, dancing, and '
                        'traditional naming ceremonies within a biblical framework.\n\n',
                  ),
                  const TextSpan(text: 'Socioeconomic Expansion:', style: boldStyle),
                  const TextSpan(
                    text:
                        ' The church transformed Tadzewu into a self-sustaining '
                        'religious headquarters. It built basic and secondary schools, '
                        'agricultural plantations, and its own printing press, '
                        'effectively acting as a socioeconomic development engine for '
                        'the region.\n\n',
                  ),
                  const TextSpan(text: 'Global Expansion:', style: boldStyle),
                  const TextSpan(
                    text:
                        ' While deeply rooted in Ewe culture and the Volta Region, '
                        'the church eventually established international branches '
                        'across Togo, Benin, Europe, and the Americas to serve the '
                        'expanding diaspora.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}