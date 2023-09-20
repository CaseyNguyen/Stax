import 'package:flutter/material.dart';
import '../wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _iconHeight = 0.0; // Initial height for the icon

  @override
  void initState() {
    super.initState();
    // Simulate a delay before navigating to the next screen.
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });

    // Start the animation
    _startAnimation();
  }

  void _startAnimation() {
    // Animate the icon height from 0 to the desired size
    setState(() {
      _iconHeight = 80.0; // Desired icon height
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Wrapper(), // Use const Wrapper()
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start position
        const end = Offset.zero; // End position
        const curve = Curves.easeInOut; // Transition curve
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRect(
              child: AnimatedContainer(
                duration: const Duration(seconds: 2), // Animation duration
                height: _iconHeight, // Height controlled by animation
                child: const Icon(
                  Icons.attach_money,
                  color: Colors.green, // Icon color
                  size: 80.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Stax',
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

