import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'mawunyonyo_screen.dart';
import 'history_screen.dart';
import 'bookmarks_screen.dart';

/// The slide-out menu opened from the hamburger icon on the home screen.
/// Add or reorder menu items here — each is just an icon + label + the
/// screen it opens.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.brandRed,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: const Row(
                children: [
                  Icon(Icons.church, color: AppColors.white, size: 32),
                  SizedBox(width: 12),
                  Text(
                    'ARS Church Hymnal',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Mawunyɔnyɔ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const MawunyonyoScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Brief History about the ARS Church and its founder'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Bookmarks'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const BookmarksScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
