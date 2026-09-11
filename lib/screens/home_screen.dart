import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/hymn.dart';
import '../services/bookmark_service.dart';
import '../services/hymn_repository.dart';
import '../main.dart' show themeModeNotifier;
import 'hymn_detail_screen.dart';
import 'app_drawer.dart';

/// Home screen: the scrollable list of hymns by number/title.
/// The hamburger icon (top-left) opens app_drawer.dart automatically —
/// Flutter adds that icon on its own whenever a Scaffold has a `drawer`
/// and no custom `leading` widget, so no extra wiring is needed here.
///
/// Hymn data now loads from assets/data/hymns.txt via HymnRepository
/// instead of being hardcoded — see _hymnsFuture below.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookmarkService _bookmarkService = BookmarkService();
  late final Future<List<Hymn>> _hymnsFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _hymnsFuture = HymnRepository.instance.loadHymns();
  }

  /// Matches by hymn number (e.g. "23") OR by any word in the title or
  /// lyrics (e.g. "grace" finds "Amazing Grace").
  List<Hymn> _filterHymns(List<Hymn> allHymns) {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return allHymns;

    return allHymns.where((hymn) {
      final matchesNumber = hymn.number.toString() == query;
      final matchesTitle = hymn.title.toLowerCase().contains(query);
      final matchesLyrics = hymn.lyrics.toLowerCase().contains(query);
      return matchesNumber || matchesTitle || matchesLyrics;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('ARS Hymnal'),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, mode, _) {
              final isDark = mode == ThemeMode.dark ||
                  (mode == ThemeMode.system &&
                      MediaQuery.platformBrightnessOf(context) == Brightness.dark);
              return IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                tooltip: 'Toggle dark/light mode',
                onPressed: () {
                  themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Hymn>>(
        future: _hymnsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Could not load hymns. Check that assets/data/hymns.txt '
                  'is listed under pubspec.yaml assets.\n\n'
                  '${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final filteredHymns = _filterHymns(snapshot.data ?? []);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search by hymn number or word',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() => _searchQuery = value),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _bookmarkService.box.listenable(),
                  builder: (context, Box<bool> box, _) {
                    return ListView.separated(
                      itemCount: filteredHymns.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final hymn = filteredHymns[index];
                        final bookmarked = _bookmarkService.isBookmarked(hymn.number);
                        return ListTile(
                          leading: SizedBox(
                            width: 36,
                            child: Text(
                              '${hymn.number}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          title: Text(
                            hymn.title,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: bookmarked
                              ? Icon(Icons.bookmark,
                                  color: Theme.of(context).colorScheme.primary)
                              : null,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => HymnDetailScreen(hymn: hymn),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}