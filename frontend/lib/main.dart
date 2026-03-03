import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CurioApp());
}

class CurioApp extends StatelessWidget {
  const CurioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curio",
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: SplashScreen(),
    );
  }
}