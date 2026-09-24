import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'mawunyonyo_screen.dart';
import 'history_screen.dart';
import 'bookmarks_screen.dart';
import 'creed_screen.dart';
import 'anthem_screen.dart';
import 'feedback_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16), // Slightly taller for breathing room
              decoration: BoxDecoration(
                color: AppColors.brandRed, // Fallback if image fails to load
                image: DecorationImage(
                  // UPDATE THIS PATH to wherever your background image is saved
                  image: const AssetImage('assets/images/cross.png'), 
                  fit: BoxFit.cover, // Ensures the image stretches to fill the rectangle
                  // This filter washes the image in your brand red at 85% opacity
                  // so you get the texture of the photo without losing text legibility
                  colorFilter: ColorFilter.mode(
                    AppColors.brandRed.withOpacity(0.50),
                    BlendMode.srcATop,
                  ),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.church_outlined, color: AppColors.white, size: 32), // Bumped icon size slightly
                  SizedBox(width: 10),
                  Text(
                    'ARS Hymnal',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22, // Bumped font size slightly for better hierarchy
                      fontWeight: FontWeight.w500, // Made slightly bolder to stand out from the background
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            const _SectionLabel('Options'),
            _DrawerItem(
              icon: Icons.bookmark_border,
              label: 'Bookmarks',
              screen: const BookmarksScreen(),
            ),
            _DrawerItem(
              icon: Icons.menu_book_outlined,
              label: 'Mawunyonyo',
              screen: const MawunyonyoScreen(),
            ),
            _DrawerItem(
              icon: Icons.auto_stories_outlined,
              label: 'Xɔsemeʋuʋu',
              screen: const CreedScreen(),
            ),
            _DrawerItem(
              icon: Icons.music_note_outlined,
              label: 'ARS Anthem',
              screen: const AnthemScreen(),
            ),

            const SizedBox(height: 8),
            const _SectionLabel('About'),
            _DrawerItem(
              icon: Icons.info_outline,
              label: 'About ARS Church',
              screen: const HistoryScreen(),
            ),

            const SizedBox(height: 8),
            const _SectionLabel('Settings'),
            _DrawerItem(
              icon: Icons.mail_outline,
              label: 'Feedback',
              screen: const FeedbackScreen(
                recipientEmail: 'etornambright20@gmail.com',
                appName: 'ARS Hymnal',
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget screen;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 4,
      visualDensity: const VisualDensity(vertical: -1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Icon(
        icon,
        size: 21,
        color: Colors.grey.shade700,
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => screen),
        );
      },
    );
  }
}