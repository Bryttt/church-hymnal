import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A single action button used in the row of Play / Bookmark / Share
/// buttons on the hymn detail screen. Using one shared widget (instead of
/// three separately-styled buttons) is what keeps them visually
/// consistent — change the styling here and all three update together.
class HymnActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool active; // e.g. bookmarked = true, playing = true

  const HymnActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = active ? theme.colorScheme.primary : theme.colorScheme.onSurface;

    return SizedBox(
      height: AppButtonStyle.height,
      child: Material(
        color: active
            ? theme.colorScheme.primary.withOpacity(0.1)
            : theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: BorderRadius.circular(AppButtonStyle.borderRadius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppButtonStyle.borderRadius),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: AppButtonStyle.iconSize, color: color),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Row of three equally-sized action buttons — used at the top of every
/// hymn detail screen. Wrapping each in Expanded is what forces them to
/// stay the same width regardless of label length.
class HymnActionBar extends StatelessWidget {
  final bool isPlaying;
  final bool audioAvailable;
  final bool isBookmarked;
  final VoidCallback onPlayPause;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onShare;

  const HymnActionBar({
    super.key,
    required this.isPlaying,
    required this.audioAvailable,
    required this.isBookmarked,
    required this.onPlayPause,
    required this.onBookmarkToggle,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Row(
        children: [
          Expanded(
            child: HymnActionButton(
              icon: isPlaying ? Icons.pause : Icons.play_arrow,
              label: audioAvailable ? (isPlaying ? 'Pause' : 'Play') : 'No audio',
              onPressed: audioAvailable ? onPlayPause : null,
              active: isPlaying,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: HymnActionButton(
              icon: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              label: 'Bookmark',
              onPressed: onBookmarkToggle,
              active: isBookmarked,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: HymnActionButton(
              icon: Icons.share,
              label: 'Share',
              onPressed: onShare,
            ),
          ),
        ],
      ),
    );
  }
}