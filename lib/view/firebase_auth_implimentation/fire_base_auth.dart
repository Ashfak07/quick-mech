import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> signUpWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('error');
    }
  }

  Future<User?> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('error');
    }
  }

  Future addUser(
    String username,
    String mobile,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      "userName": username,
      "mobile": mobile,
      "email": email,
    });
  }

  Future createUserInFirestore(
    User user,
    String username,
    String mobile,
  ) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (!doc.exists) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'userName': username,
        'email': user.email,
        "mobile": mobile,
      });
    }
  }
}
