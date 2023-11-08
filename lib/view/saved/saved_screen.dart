import 'package:flutter/material.dart';
//import 'package:quickmech/utils/color_constants.dart';

class saved extends StatefulWidget {
  const saved({super.key});

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Saved",style: TextStyle(fontSize: 25
        ,color: Colors.black),),
    forceMaterialTransparency: true,
    ),
  body: Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("You haven't saved anything")],),
  ),

    );
  }
}