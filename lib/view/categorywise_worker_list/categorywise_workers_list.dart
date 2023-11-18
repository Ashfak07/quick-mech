import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/fav_controller/fav_controller.dart';
import 'package:quickmech/controller/mechanic_controller/mechanic_controller.dart';

class CategoryWiseWorkerscreen extends StatelessWidget {
  const CategoryWiseWorkerscreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName.toString()),
        ),
        body: Text('hi'));
  }
}
