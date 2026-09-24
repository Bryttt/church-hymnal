import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// SingleTickerProviderStateMixin is required to run animations
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. The Controller manages the timing (1.5 seconds feels premium)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // 2. Slide Animation: Starts slightly below center (0.2) and moves to center (0.0)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), 
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut, // Smooth deceleration
    ));

    // 3. Scale Animation: Starts invisible (0.0) and pops to full size (1.0)
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // The magic curve that gives it the "pop" bounce
    ));

    // 4. Start the animation, then navigate exactly when it finishes
    _controller.forward().then((_) {
      if (!mounted) return;
      
      // A smooth crossfade transition into the HomeScreen
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Always clean up controllers to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Wrap your column in the transitions
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/ars2.png', 
                  width: 400, 
                  height: 400,
                ),
                Text(
                  'ARS Hymnal',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}