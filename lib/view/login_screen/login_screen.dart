import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/login_controller/login_controller.dart';
import 'package:quickmech/main.dart';
import 'package:quickmech/mechanic_module/view/homescreen/homescreen.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:quickmech/view/common/snackbar/snackbar_screen.dart';
import 'package:quickmech/view/firebase_auth_implimentation/fire_base_auth.dart';
import 'package:quickmech/view/home_screen/home_screen.dart';
import 'package:quickmech/view/intro_screen/intro_screen.dart';
import 'package:quickmech/view/registration_screen/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final bool userLoginType;
  const LoginScreen({super.key, required this.userLoginType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;
  bool _isSecurePassword = true;
  final FirebaseAuthServices auth = FirebaseAuthServices();
  // RegistrationController registrationController = RegistrationController();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.sizeOf(context).width;
    var mediaheight = MediaQuery.sizeOf(context).height;
    FocusNode fieldone = FocusNode();
    FocusNode fieldtwo = FocusNode();
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 42),
                  ),
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      ),
                      color: ColorConstants.bannerColor),
                  // child: Image.asset(
                  //   'assets/images/shopping.png',
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Container(
                color: ColorConstants.bannerColor,
                child: Container(
                  height: 526,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          bottomRight: Radius.circular(60)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.userLoginType == true
                                      ? 'User'
                                      : 'Mechanic',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstants.bannerColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            TextFormField(
                              controller: _usernamecontroller,
                              keyboardType: TextInputType.emailAddress,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldone,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(fieldtwo);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'username or email',
                                  prefixIcon: Icon(Icons.person)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ('required');
                                  // } else if (value.isNotEmpty &&
                                  //     mydb.keys.contains(value)) {
                                  //   return ("UserName is not registered");
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _passwordcontroller,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldtwo,
                              // onFieldSubmitted: (value) {
                              //   FocusScope.of(context).requestFocus(fieldtwo);
                              // },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'password',
                                  prefixIcon: Icon(Icons.key),
                                  suffixIcon: togglePassword()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ('required');
                                } else {
                                  return (null);
                                }
                              },
                              obscureText: _isSecurePassword,
                            ),
                          ],
                        ),
                      ),
                      // Positioned(
                      //     bottom: 450,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 180),
                      //       child: Container(child: Text('OR')),
                      //     )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen(
                                              userLoginType:
                                                  widget.userLoginType,
                                            )));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 1),
                                child: Text(
                                  'Don\'t have account?',
                                  style: TextStyle(fontSize: mediaWidth * .03),
                                ),
                              )),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              sign();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstants.bannerColor,
                                borderRadius: BorderRadius.circular(15)),
                            height: 50,
                            child: Center(
                              child: Text(
                                "Sign in",
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
              ),
              // Spacer(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                      ),
                      color: ColorConstants.bannerColor),
                  // child: Image.asset(
                  //   'assets/images/shopping.png',
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ],
          ),
        ));
  }

  void sign() async {
    if (widget.userLoginType == true) {
      User? user = await auth.signInWithEmailandPassword(
          _usernamecontroller.text, _passwordcontroller.text);
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(saveKey, true);
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      } else {
        final _errorMessage = 'password and username does not match';
        ShowSnackbar().showSnackbar(context: context, content: _errorMessage);
      }
    } else {
      CollectionReference mechanics =
          FirebaseFirestore.instance.collection('mechanics');
      mechanics.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['email'] == _usernamecontroller.text &&
              doc['password'] == _passwordcontroller.text) {
            Provider.of<LoginController>(context).isMechanicLoggedIn = true;
            Provider.of<LoginController>(context).mechanicId = doc.id;
            ShowSnackbar().showSnackbar(
                context: context, content: "Logged in successfully");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenMechanic(),
                ));
          } else {
            ShowSnackbar()
                .showSnackbar(context: context, content: "Unable to login");
          }
        });
      });
    }
  }

  // void checkLogin(BuildContext context) async {
  //   if (_usernamecontroller.text == _passwordcontroller.text) {
  //     final sharedpref = await SharedPreferences.getInstance();
  //     await sharedpref.setBool(savekey, true);
  //   }
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => IntroScreen()));
  // }

  // void checkLogin(BuildContext context, index) async {
  //   final _username = _usernamecontroller.text;
  //   final _password = _passwordcontroller.text;
  //   if (_username == registrationController.userCred[index].email ||
  //       _username == registrationController.userCred[index].username &&
  //           _password == registrationController.userCred[index].password) {
  //     final _sharedPref = await SharedPreferences.getInstance();
  //     await _sharedPref.setBool(SAVE_KEY_NAME, true);
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => WelcomePage()));
  //   } else {
  //     final _errorMessage = 'password and username does not matchhhhh';
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red,
  //         margin: EdgeInsets.all(10),
  //         content: Text(_errorMessage)));
  //   }
  // }

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
}
