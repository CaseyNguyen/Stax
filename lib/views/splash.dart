import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const Wrapper(), // The screen to navigate to after the splash screen
      duration: 2000, // Duration in milliseconds for which the splash screen will be visible
      backgroundColor: Colors.black12, // Background color of the splash screen
      text: 'Stax', // Your app's name or any text you want to display
      textType: TextType.ColorizeAnimationText, // Animation type for the text
      textStyle: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ), // Style for the text
      colors: const [
        Colors.blue,
        Colors.green,
        Colors.orange,
        Colors.red,
      ], // List of colors for text animation (if TextType is ColorizeAnimationText)
    );
  }
}