import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  CollectionReference mechanics =
      FirebaseFirestore.instance.collection('mechanicCredentials');
  bool isOnline = false;
  String? mechanicId;

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mechanicId = await prefs.getString('mechanicId');
    notifyListeners();
  }

  getStatus() async {
    isOnline =
        await mechanics.doc(mechanicId).get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        return snapshot['isOnline'];
      } else {
        return false;
      }
    });
    notifyListeners();
  }

  Future statusUpdate() async {
    await mechanics
        .doc(mechanicId)
        .update({'isOnline': isOnline})
        .then((value) => print('Status updated'))
        .catchError((error) => print('Status not updated $error'));
    notifyListeners();
  }
}
