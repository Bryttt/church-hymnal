import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/splash_screen.dart';
import 'services/bookmark_service.dart';
import 'theme/app_theme.dart';

/// Global theme mode notifier. Any screen can flip this
/// (see the toggle button in home_screen.dart's AppBar) and the whole
/// app rebuilds with the new theme — no provider package needed for
/// something this small.
final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await BookmarkService.init();
  runApp(const HymnalApp());
}

class HymnalApp extends StatelessWidget {
  const HymnalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'ARS Hymnal',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
