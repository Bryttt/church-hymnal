# Church Hymnal App

A Flutter app for browsing hymn lyrics, playing tune recordings, and
bookmarking favorites — no login or backend required.

## Setup

1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install) if you haven't already.
2. From this project's root directory:
   ```
   flutter pub get
   flutter run
   ```

## Where each feature lives

| Feature | File | Notes |
|---|---|---|
| Red/white brand colors, button sizing | `lib/theme/app_theme.dart` | Change `AppColors.brandRed` here to match your logo exactly — everything else follows automatically. |
| Play / Bookmark / Share buttons (consistent size+style) | `lib/widgets/hymn_action_bar.dart` | `HymnActionButton` = one button. `HymnActionBar` = the row of three. Edit here to change how all three look everywhere at once. |
| Hymn detail screen (lyrics, scrolling stanzas) | `lib/screens/hymn_detail_screen.dart` | Uses `HymnActionBar` at the top; lyrics scroll below via `SingleChildScrollView`. |
| Home screen (hymn list, search, visual hierarchy) | `lib/screens/home_screen.dart` | `_filteredHymns` getter = search-by-number-or-word logic. The `ListTile` styling in the `itemBuilder` = grey number / bold title hierarchy. |
| Hamburger drawer menu | `lib/screens/app_drawer.dart` | The three `ListTile`s here are Mawunyonyo, Church History, Bookmarks — add/reorder/rename menu items here. Drawer icon appears automatically because `Scaffold(drawer: ...)` is set in `home_screen.dart`. |
| Mawunyonyo screen | `lib/screens/mawunyonyo_screen.dart` | Placeholder — replace the body text with real content. |
| Church history screen | `lib/screens/history_screen.dart` | Placeholder — replace the body text with the real history of the ARS Church and its founder. |
| Bookmarks screen | `lib/screens/bookmarks_screen.dart` | Filtered view of bookmarked hymns; same list styling as home screen. |
| Bookmark storage (local, no login) | `lib/services/bookmark_service.dart` | Hive-backed; `toggleBookmark`, `isBookmarked`, `bookmarkedNumbers`. |
| Splash screen | `lib/screens/splash_screen.dart` | Swap the placeholder `Icon` for `Image.asset('assets/images/church_logo.png')` once you add your logo. |
| Dark/light mode toggle | `lib/main.dart` (`themeModeNotifier`) + icon button in `home_screen.dart`'s AppBar | Global `ValueNotifier` — any screen can flip it. |
| Hymn data model | `lib/models/hymn.dart` | `number`, `title`, `lyrics`, `audioAsset`. |
| Sample hymn data | `lib/data/sample_hymns.dart` | 3 public-domain placeholder hymns — replace with your real hymnal. |

## Before this is ready for real use

- **Replace sample hymns** in `lib/data/sample_hymns.dart`. Past ~50 hymns,
  switch to loading from a bundled JSON file instead of hardcoding Dart
  objects — ask me and I'll build that loader.
- **Add your church's logo**: drop a PNG into `assets/images/church_logo.png`,
  update `splash_screen.dart` to use it, then run:
  ```
  flutter pub run flutter_native_splash:create
  ```
- **Add audio files** into `assets/audio/` matching each hymn's `audioAsset`
  path. Until then, the Play button will show "No audio" — expected.
- **Fill in the two placeholder screens**: `mawunyonyo_screen.dart` and
  `history_screen.dart` currently just show a placeholder sentence.
- **Check licensing** on hymns still under copyright before distributing
  lyrics/audio, even internally within the church.

## Project structure

```
lib/
  main.dart                       # Entry point, theme mode notifier
  models/hymn.dart                # Hymn data model
  data/sample_hymns.dart          # Sample hymn data (replace with real data)
  services/bookmark_service.dart  # Local bookmark storage (Hive)
  widgets/hymn_action_bar.dart    # Consistent Play/Bookmark/Share buttons
  screens/
    splash_screen.dart
    home_screen.dart
    hymn_detail_screen.dart
    bookmarks_screen.dart
    app_drawer.dart                # Hamburger menu
    mawunyonyo_screen.dart          # Placeholder — add real content
    history_screen.dart             # Placeholder — add real content
  theme/app_theme.dart             # Brand colors + button sizing
assets/
  audio/                           # Hymn tune recordings go here
  images/                          # Church logo goes here
```
