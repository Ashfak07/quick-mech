import 'package:flutter/material.dart';
import 'package:quickmech/view/activity_screen/activity.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:quickmech/view/home_screen/home_screen.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';
import 'package:quickmech/view/saved/incomingdata.dart';
import 'package:quickmech/view/saved/saved_screen.dart';
import 'package:quickmech/view/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Saveddata());
  }
}
