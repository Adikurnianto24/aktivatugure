import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset(
            'assets/tugure_logo.png',
            width: 300, // Atur ukuran sesuai kebutuhan
          ),
        ),
      ),
    );
  }
}
