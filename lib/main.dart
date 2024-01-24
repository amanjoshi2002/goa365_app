import 'package:flutter/material.dart';
import 'package:freedom365_app/views/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false here
      home: WelcomeScreen(),
      title: "Freedom 365",
    );
  }
}

