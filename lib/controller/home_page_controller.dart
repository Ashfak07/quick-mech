import 'package:flutter/material.dart';
import 'package:quickmech/utils/database/database.dart';

class HomeScreenProvider with ChangeNotifier {
  database db = database();
  List data = [];
  FetchWorkerProfile(int index) {
    data = database.mechanic.map((e) {
      e.containsKey('image');
    }).toList();
    notifyListeners();
  }
}
