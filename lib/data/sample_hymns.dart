import '../models/hymn.dart';

/// Placeholder hymn list for development and testing.
///
/// Replace this with your church's full hymnal — either by expanding this
/// list, or (recommended once you have more than ~50 hymns) loading from a
/// bundled JSON file in `assets/` instead of hardcoding Dart objects.
///
/// The lyrics below are public-domain hymn texts, included only as sample
/// data so the app has something to display while you build.
final List<Hymn> sampleHymns = [
  const Hymn(
    number: 1,
    title: 'Mitsɔ kafukafu kpedada',
    lyrics: '''
Mitsɔ kafukafu 'kpedada
Na mia Mawu fia la,
'Mesi na nuwo kata mi faa,
Na dzidzeme mi.
Eda'ƒe yayra si ɖe mia dzi
Dzidzɔwo keŋ mienya,
Eya na'nyigbadzinuwo mi
'Yata mia kafui
|: Akpe, kafu
Na mia Mawu fia la,
'Mesi na nuwo kata mi faa
Na dzidzeme mi:|
''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),
  const Hymn(
    number: 2,
    title: 'Makafu Aƒetɔ ƒe dɔmenyonyo',
    lyrics: '''
Makafu Aƒetɔ ƒe dɔmenyonyo
Makaƒu Aƒeto ƒe dɔmenyonyo
Madzi ha, madzi ha
Madzi ha, madzi ha.
Madzi kafukafu ha na Aƒetɔ
Le Eƒe dɔmenyonyo gã la ta.
''',
    audioAsset: 'assets/audio/hymn_002.mp3',
  ),
  const Hymn(
    number: 3,
    title: 'Nusianu kafu Mawu,',
    lyrics: '''
Nusianu kafu Mawu,
Dziƒo 'nyigba kpl'atsiafu.
Wo keŋ ɖe wò bubu fia.
Miakpɔ wò ŋusẽ gä la.
Míeva be míakafu wò,
Nusianu kafu Mawu.

Nusianu kafu Mawu,
Zãmu kple tsidzadza hà.
Ɣetotoe kpl'alilikpo
Tɔsisiwo kple ahomwo
Ɣeyiyiwo na bubu wo,
Mawu gà míekafu wò.

Nusianu kafu Mawu
Wɔla ŋusékatatɔ,
Gbɔgbɔ kɔkɔe akɔfala
Miebɔbɔ de wò afonu;
Xɔ mía kafu madinu,
Mieɖe kuku mía Mawu.

''',
    audioAsset: 'assets/audio/hymn_003.mp3',
  ),
const Hymn(
    number: 4,
    title: 'Kafu bubufia la,',
    lyrics: '''
Kafu bubufia la,
Mawu ɖeka hɔ̃e.
Kafui le nukunu siwo Woɖe fia
Le fe nɔnɔ kpli mí le zɔzɔyime
Le dzo babla kple alili dodoa ta.
Dɔlawo mikafui kple kasaŋkuwo
Mi ƒ'aʋakɔ siwo kpɔ ƒe nku me la
Le 'fe fiaduƒe me
Azɔ kple daasi
I: 'Ƒe dɔwo akafui,
Ƒe dɔwo akafui,
Ƒe dɔwo akafui,
Kafui luʋɔnye :|\n

Kafui le luʋɔwo ƒe ɖeɖe gà ta
Kafui l'agbetsi si gbɔ agbe mi ta.
Le 'ƒe nu nguie nana
Kple belélé ta
Kple xɔse sia be;
Woase mía gbedoɖa.
Dɔlawo mikafui kple kasaŋkuwo
Mi ƒ'aʋakɔ siwo kpɔ ƒe nku me la
Le 'fe fiaduƒe me
Azɔ kple daasi
I: 'Ƒe dɔwo akafui,
Ƒe dɔwo akafui,
Ƒe dɔwo akafui,
Kafui luʋɔnye :|

''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),
const Hymn(
    number: 5,
    title: 'Azɔ la mi kată,',
    lyrics: '''
Azɔ la mi kată,
Miɖa kpe na mía Mawu
Tso miaƒe dzi me ke
Kple miaƒe aɖewo hã!
|: Halelluya, Halelluya!
Midzi Halelluya he. :|\n\n
Mibia mía Mawu be,
Wòana dzidzɔ geɖe mí
Kple ŋutifafa hã
Gbesiagbe le mía gbe me,
|: Halelluya, Halellaya!

''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),

  const Hymn(
    number: 6,
    title: 'Halelluya kafu Mawu',
    lyrics: '''
Halelluya kafu Mawu,
Halelluya kafu Mawu.
''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),

  const Hymn(
    number: 7,
    title: 'Mida kpe nɛ',
    lyrics: '''
Mida kpe nɛ!
Mida kpe nɛ!
Mikafu Yehowa,
Mida kpe nɛ!
''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),

  const Hymn(
    number: 8,
    title: 'Kafukafu woana Mawu',
    lyrics: '''
Kafukafu woana Mawu Fiaga
|: Elolo, Elolo,
Eƒe dɔmenyonyo la elolo. :|\n

Akpe ko miaɖa na Mawu Fiagã
|: Elolo, Elolo,
Eƒe dɔmenyonyo la elolo. :|
''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),

  const Hymn(
    number: 9,
    title: 'Madzi ha na Yehowa',
    lyrics: '''
|: Madzi ha na Yehowa :|
Madzi ha kafu Mawunye
Esi mel'agbe. :|
l: Nye susuwo avivi nu.
Eya ŋu madzɔ dzi. :|
Madzi ha na Yehowa
Madzi ha kafu Mawunye
Esi mel'agbe.
Kafu Mawu! Kafu Mawu Kafu Mawu!
''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),

  const Hymn(
    number: 10,
    title: 'Ɖela Yesu makafu wò',
    lyrics: '''
Ɖela Yesu makafu wò,
Fisiafi si mayi la.
Ne vɔ̃ ŋkekewo va hã la
Eye nye mɔ do tsizi;
Ne xɔ̃nye veviewo agblém ɖi,
Le agbe sia me hã la;
Wo ko ŋu maɖo ŋu ɖo ɖa
Wo nya nye nyateƒe sɔŋ.
l: Maka ɖe dzi, maka ɖe dzi
Maka ɖe dzi ɣesiaɣi :|\n

Ɖela Yesu makafu wò
Wò ɖeka gbɔ manɔ ɖaa.
Ne tetekpɔwo va hã la,
Mate kpɔ aɖu wo dzi.
Ne nye ɖeka metsia nyi ia,
Dzika tsoa ƒonye ŋutɔ;
Kplɔm nyuie Aƒeto kplɔm nyuie
Ekem nye mabu mɔ o.
Maka ɖe dzi.......

''',
    audioAsset: 'assets/audio/hymn_001.mp3',
  ),

];
