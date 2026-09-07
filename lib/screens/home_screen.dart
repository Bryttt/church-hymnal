import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/sample_hymns.dart';
import '../models/hymn.dart';
import '../services/bookmark_service.dart';
import '../main.dart' show themeModeNotifier;
import 'hymn_detail_screen.dart';
import 'app_drawer.dart';

/// Home screen: the scrollable list of hymns by number/title.
/// The hamburger icon (top-left) opens app_drawer.dart automatically —
/// Flutter adds that icon on its own whenever a Scaffold has a `drawer`
/// and no custom `leading` widget, so no extra wiring is needed here.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookmarkService _bookmarkService = BookmarkService();
  String _searchQuery = '';

  /// Matches by hymn number (e.g. "23") OR by any word in the title or
  /// lyrics (e.g. "grace" finds "Amazing Grace").
  List<Hymn> get _filteredHymns {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return sampleHymns;

    return sampleHymns.where((hymn) {
      final matchesNumber = hymn.number.toString() == query;
      final matchesTitle = hymn.title.toLowerCase().contains(query);
      final matchesLyrics = hymn.lyrics.toLowerCase().contains(query);
      return matchesNumber || matchesTitle || matchesLyrics;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredHymns = _filteredHymns;

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
      body: Column(
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
                      // Number is de-emphasized (grey, smaller) and the
                      // title carries the visual weight — this is the
                      // "hierarchy" styling: number is a reference, the
                      // title is what a reader is actually scanning for.
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
      ),
    );
  }
}
