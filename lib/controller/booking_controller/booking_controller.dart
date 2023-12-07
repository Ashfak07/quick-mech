import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingController with ChangeNotifier {
  void AddBooking(
    // String username,
    // String mobile,
    // String location,
    // String address,
    String vehicledetails,
    String AdditionalDetails,
  ) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference bookingid =
        await FirebaseFirestore.instance.collection('yourbooking').doc();
    await FirebaseFirestore.instance
        .collection("booking deatils")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('yourbooking')
        .doc()
        .set({
      "bookingId": bookingid.id,
      "clientname": '',
      "mobile": '',
      "location": '',
      "address": '',
      "vehicledetails": vehicledetails,
      "additionaldetails": AdditionalDetails,
      "uid": user!.uid,
    });
    notifyListeners();
  }
}
