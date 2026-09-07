/// Represents a single hymn: its number, title, lyrics, and optional
/// path to a local or remote audio recording of the tune.
class Hymn {
  final int number;
  final String title;
  final String lyrics;
  final String? audioAsset; // e.g. 'assets/audio/hymn_001.mp3'

  const Hymn({
    required this.number,
    required this.title,
    required this.lyrics,
    this.audioAsset,
  });
}
