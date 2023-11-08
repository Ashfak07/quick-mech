import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/project-controller/project-controller.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProjectController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ProjectController>(context).isDark
            ? ThemeData.dark()
            : ThemeData.light(),
        home: Scaffold(),
      ),
    );
  }
}
