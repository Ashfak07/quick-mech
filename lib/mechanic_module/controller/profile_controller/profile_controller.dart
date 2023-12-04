import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  addDetails(String mechanicId, String fullName, String, mobile,
      String whatsapp, String category, String currentLocation) async {
    CollectionReference mechanics =
        FirebaseFirestore.instance.collection('mechanics');
    await mechanics.doc(mechanicId).set({
      'fullName': fullName,
      'mobile': mobile,
      'whatsapp': whatsapp,
      'category': category,
      'isOnline': false,
      'currentLocation': currentLocation
    });
  }
}
