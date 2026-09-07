import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Shown briefly on app launch before navigating to the home screen.
///
/// Note: this is a simple in-app splash (a widget shown after Flutter
/// has already started). For a native splash that appears instantly
/// while Flutter itself is loading, this project also configures the
/// `flutter_native_splash` package in pubspec.yaml — the two work
/// together: native splash covers cold-start, this covers the branded
/// pause afterward.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Swap this Icon for Image.asset('assets/images/church_logo.png')
        // once you add your church's actual logo file.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          
              Image.asset('assets/images/ars2.png', width: 600, height: 600,),
            
            // const SizedBox(height: 16),
            Text(
              'ARS Hymnal',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
