import 'package:flutter/material.dart';
import 'package:quickmech/view/profile_screen/profile_screen.dart';
import 'package:quickmech/view/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ProfileScreen());
  }
}
