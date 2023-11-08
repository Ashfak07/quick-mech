import 'package:flutter/material.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';
import 'package:quickmech/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: const SplashScreen());
  }
}
