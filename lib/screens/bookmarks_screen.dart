import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/hymn.dart';
import '../services/bookmark_service.dart';
import '../services/hymn_repository.dart';
import 'hymn_detail_screen.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkService = BookmarkService();

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked Hymns')),
      body: FutureBuilder<List<Hymn>>(
        future: HymnRepository.instance.loadHymns(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Could not load hymns: ${snapshot.error}'));
          }

          final allHymns = snapshot.data ?? [];

          return ValueListenableBuilder(
            valueListenable: bookmarkService.box.listenable(),
            builder: (context, Box<bool> box, _) {
              final bookmarkedNumbers = bookmarkService.bookmarkedNumbers;
              final bookmarkedHymns = allHymns
                  .where((hymn) => bookmarkedNumbers.contains(hymn.number))
                  .toList();

              if (bookmarkedHymns.isEmpty) {
                return const Center(
                  child: Text('No bookmarks yet — tap the bookmark icon on any hymn.'),
                );
              }

              return ListView.separated(
                itemCount: bookmarkedHymns.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final hymn = bookmarkedHymns[index];
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
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.bookmark, color: Theme.of(context).colorScheme.primary),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => HymnDetailScreen(hymn: hymn)),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}