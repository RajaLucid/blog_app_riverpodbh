import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.teal,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Center(
            child: Image.asset("assets/LucidPluslogo.webp"),
          ),
          const Center(
            child: Text(
              "Lucid Plus Blog App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
