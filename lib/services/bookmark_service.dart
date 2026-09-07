import 'package:hive_flutter/hive_flutter.dart';

/// Manages bookmarked hymn numbers using a local Hive box.
///
/// No login is required — bookmarks live entirely on-device. This keeps
/// the app simple (no backend, no accounts) at the cost of bookmarks not
/// syncing across a user's devices, which is an acceptable trade-off for
/// this app's use case.
class BookmarkService {
  static const String _boxName = 'bookmarks';

  static Future<void> init() async {
    await Hive.openBox<bool>(_boxName);
  }

  Box<bool> get _box => Hive.box<bool>(_boxName);

  bool isBookmarked(int hymnNumber) {
    return _box.get(hymnNumber.toString(), defaultValue: false) ?? false;
  }

  Future<void> toggleBookmark(int hymnNumber) async {
    final key = hymnNumber.toString();
    final current = _box.get(key, defaultValue: false) ?? false;
    await _box.put(key, !current);
  }

  List<int> get bookmarkedNumbers {
    return _box.keys
        .where((key) => _box.get(key) == true)
        .map((key) => int.parse(key as String))
        .toList()
      ..sort();
  }

  /// Exposes the raw box so widgets can wrap themselves in a
  /// ValueListenableBuilder(valueListenable: box.listenable(), ...)
  /// to auto-rebuild when a bookmark is toggled.
  Box<bool> get box => _box;
}
