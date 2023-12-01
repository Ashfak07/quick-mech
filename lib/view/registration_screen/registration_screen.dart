import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/common/snackbar/snackbar_screen.dart';
import 'package:quickmech/view/firebase_auth_implimentation/fire_base_auth.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final bool userLoginType;
  const RegistrationScreen({super.key, required this.userLoginType});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isSecurePassword = true;
  final FirebaseAuthServices auth = FirebaseAuthServices();
  // RegistrationController registrationController = RegistrationController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  FocusNode fieldone = FocusNode();
  FocusNode fieldtwo = FocusNode();
  FocusNode fieldthree = FocusNode();
  FocusNode fieldfour = FocusNode();
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    // var mediaheight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: ColorConstants.bannerColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    focusNode: fieldone,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldtwo);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: usernamecontroller,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    focusNode: fieldtwo,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldthree);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'username',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: mobilecontroller,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    focusNode: fieldthree,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldthree);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'mobile',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    focusNode: fieldfour,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'password',
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: togglePassword()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                    obscureText: _isSecurePassword,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                    userLoginType: widget.userLoginType,
                                  )));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                      child: Text(
                        'Already have account',
                        style: TextStyle(fontSize: mediawidth * .03),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              child: InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    signUp();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.bannerColor,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  child: Center(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }

  void signUp() async {
    User? user = await auth.signUpWithEmailandPassword(
        emailcontroller.text, passwordcontroller.text);
    auth.addUser(
        usernamecontroller.text, mobilecontroller.text, emailcontroller.text);
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    if (widget.userLoginType == true) {
      User? user = await auth.signUpWithEmailandPassword(
          emailcontroller.text, passwordcontroller.text);
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen(
                      userLoginType: widget.userLoginType,
                    )));
      }
    } else {
      CollectionReference mechanicCredentials =
          FirebaseFirestore.instance.collection('mechanicCredentials');
      await mechanicCredentials.add({
        'email': emailcontroller.text,
        'password': passwordcontroller.text
      }).then((value) {
        ShowSnackbar().showSnackbar(
            context: context, content: 'Registered as a mechanic successfully');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LoginScreen(userLoginType: widget.userLoginType),
            ));
      }).catchError((error) {
        ShowSnackbar()
            .showSnackbar(context: context, content: 'Failed to register');
      });
      ;
    }
  }
}
