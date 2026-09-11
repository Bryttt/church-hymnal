import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/language_toggle.dart';

/// "Brief History about the ARS Church and its founder" — opened from the
/// hamburger drawer menu. Toggle between English and Ewe.
///
/// The Ewe version is a placeholder — fill in _eweFounderText and
/// _eweHistoryText below once you have a translation from a fluent
/// speaker. Until then, selecting "Eʋegbe" will show a note saying the
/// translation isn't ready yet, rather than showing broken/empty content.
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  AppLanguage _language = AppLanguage.english;

  // ── Fill these in once you have an Ewe translation ──
  static const String? _eweFounderText = null;
  static const String? _eweHistoryText = null;

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

    final showingEwe = _language == AppLanguage.ewe;
    final eweNotReady = showingEwe && (_eweFounderText == null || _eweHistoryText == null);

    return Scaffold(
      appBar: AppBar(title: const Text('About ARS Church')),
      backgroundColor: AppColors.brandRed,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LanguageToggle(
              selected: _language,
              onChanged: (lang) => setState(() => _language = lang),
              foregroundColor: Colors.white,
            ),
            const SizedBox(height: 20),

            if (eweNotReady) ...[
              const Text(
                'The Ewe translation for this page hasn\'t been added yet.',
                style: baseStyle,
              ),
            ] else if (showingEwe) ...[
              // Once _eweFounderText / _eweHistoryText are filled in above,
              // render them here the same way the English version does
              // below (Text.rich with bold/italic spans, or plain Text
              // if you don't need inline emphasis).
              Text(_eweFounderText!, style: baseStyle),
              const SizedBox(height: 20),
              Text(_eweHistoryText!, style: baseStyle),
            ] else ...[
              // ── English: Founder section ──
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
                    const TextSpan(text: ' was born in '),
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

              // ── English: Church history section ──
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
          ],
        ),
      ),
    );
  }
}