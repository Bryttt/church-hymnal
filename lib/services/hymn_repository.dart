import 'package:flutter/services.dart' show rootBundle;
import '../models/hymn.dart';

class HymnRepository {
  HymnRepository._();
  static final HymnRepository instance = HymnRepository._();

  static const String _delimiter = '###HYMN###';

  List<Hymn>? _cachedHymns;

  Future<List<Hymn>> loadHymns() async {
    if (_cachedHymns != null) return _cachedHymns!;

    final raw = await rootBundle.loadString('assets/data/hymns.txt');
    final hymns = _parse(raw);
    _cachedHymns = hymns;
    return hymns;
  }

  List<Hymn> _parse(String raw) {
    final blocks = raw.split(_delimiter).map((b) => b.trim()).where((b) => b.isNotEmpty);

    final hymns = <Hymn>[];
    for (final block in blocks) {
      final lines = block.split('\n');
      if (lines.length < 2) continue;

      final number = int.tryParse(lines[0].trim());
      if (number == null) continue;

      final title = lines[1].trim();
      final lyrics = lines.skip(2).join('\n').trim();

      final paddedNumber = number.toString().padLeft(3, '0');
      final audioAsset = 'assets/audio/hymn_$paddedNumber.mp3';

      hymns.add(Hymn(number: number, title: title, lyrics: lyrics, audioAsset: audioAsset));
    }

    hymns.sort((a, b) => a.number.compareTo(b.number));
    return hymns;
  }
}