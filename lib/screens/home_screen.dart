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
    // 1. Grab the current theme's background color (adapts to light/dark mode)
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    // Get the text color for the bookmark icon (white in dark mode, dark in light mode)
    final textColor = Theme.of(context).colorScheme.onSurface;

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
      // 2. Wrap the body in a Container to hold the dynamic watermark
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // UPDATE THIS PATH to your desired background image
            image: const AssetImage('assets/images/cross.png'),
            fit: BoxFit.cover,
            // 3. Wash the image with the theme color at 70% opacity
            colorFilter: ColorFilter.mode(
              bgColor.withOpacity(0.70),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: FutureBuilder<List<Hymn>>(
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
                    'Could not load hymns.\n\n${snapshot.error}',
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
                    decoration: InputDecoration(
                      hintText: 'Search by hymn number or word',
                      prefixIcon: const Icon(Icons.search),
                      // 4. Upgraded Search Bar UI
                      filled: true,
                      fillColor: Theme.of(context).cardColor.withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
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
                        // 5. Lightened the divider so it doesn't clash with the background
                        separatorBuilder: (_, __) => Divider(
                          height: 1, 
                          color: Colors.grey.withOpacity(0.2)
                        ),
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
                                    color: textColor) // Changed to use dynamic text color
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
      ),
    );
  }
}