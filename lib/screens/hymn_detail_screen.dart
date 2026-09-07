import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';
import '../models/hymn.dart';
import '../services/bookmark_service.dart';
import '../widgets/hymn_action_bar.dart';

/// Shows one hymn's lyrics in full, with the Play / Bookmark / Share
/// action bar (see widgets/hymn_action_bar.dart) fixed at the top.
/// Long hymns simply scroll — no pagination — so all stanzas are
/// reachable by scrolling down.
class HymnDetailScreen extends StatefulWidget {
  final Hymn hymn;

  const HymnDetailScreen({super.key, required this.hymn});

  @override
  State<HymnDetailScreen> createState() => _HymnDetailScreenState();
}

class _HymnDetailScreenState extends State<HymnDetailScreen> {
  final BookmarkService _bookmarkService = BookmarkService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _audioLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAudio();
    _audioPlayer.playerStateStream.listen((state) {
      if (!mounted) return;
      setState(() => _isPlaying = state.playing);
    });
  }

  Future<void> _loadAudio() async {
    if (widget.hymn.audioAsset == null) return;
    try {
      await _audioPlayer.setAsset(widget.hymn.audioAsset!);
      if (mounted) setState(() => _audioLoaded = true);
    } catch (_) {
      // Audio file not bundled yet — Play button shows "No audio" until
      // a real .mp3 is added under assets/audio/. This is expected for
      // now, not a bug.
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  Future<void> _toggleBookmark() async {
    await _bookmarkService.toggleBookmark(widget.hymn.number);
    setState(() {});
  }

  void _showShareOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Copy lyrics'),
                onTap: () {
                  Clipboard.setData(ClipboardData(
                    text: '${widget.hymn.title}\n\n${widget.hymn.lyrics}',
                  ));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lyrics copied')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share to...'),
                onTap: () {
                  Navigator.pop(context);
                  Share.share('${widget.hymn.title}\n\n${widget.hymn.lyrics}');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookmarked = _bookmarkService.isBookmarked(widget.hymn.number);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.hymn.number}. ${widget.hymn.title}'),
      ),
      body: Column(
        children: [
          // Play / Bookmark / Share — same widget everywhere, so these
          // three buttons are always the same size and style.
          HymnActionBar(
            isPlaying: _isPlaying,
            audioAvailable: _audioLoaded,
            isBookmarked: bookmarked,
            onPlayPause: _togglePlayback,
            onBookmarkToggle: _toggleBookmark,
            onShare: _showShareOptions,
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.hymn.lyrics,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
