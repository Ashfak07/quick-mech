import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  addDetails(
      {required String mechanicId,
      required String fullName,
      required String mobile,
      required String whatsapp,
      required String category,
      required String currentLocation}) async {
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
