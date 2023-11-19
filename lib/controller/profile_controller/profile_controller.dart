import 'package:flutter/material.dart';
import 'package:quickmech/model/profile_model.dart';
import 'package:quickmech/utils/database/user_db.dart';

class ProfileController with ChangeNotifier {
  List<ProfileModel> profileList = [];
  void getProfile() async {
    profileList = await user.map((e) {
      return ProfileModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
