import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/login_controller/login_controller.dart';
import 'package:quickmech/mechanic_module/view/homescreen/homescreen.dart';
import 'package:quickmech/mechanic_module/view/registration_screen/registration_screen.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/common/snackbar/snackbar_screen.dart';
import 'package:quickmech/view/firebase_auth_implimentation/fire_base_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenMechanic extends StatefulWidget {
  final bool userLoginType;
  const LoginScreenMechanic({super.key, required this.userLoginType});

  @override
  State<LoginScreenMechanic> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenMechanic> {
  int index = 0;
  bool _isSecurePassword = true;
  final FirebaseAuthServices auth = FirebaseAuthServices();
  // RegistrationController registrationController = RegistrationController();
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.sizeOf(context).width;
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
                                  'Mechanic',
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
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldone,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(fieldtwo);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'email',
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
                              controller: passwordController,
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
                                            RegistrationScreenMechanic(
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
                              signIn();
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

  void signIn() async {
    CollectionReference mechanics =
        await FirebaseFirestore.instance.collection('mechanicCredentials');
    mechanics.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        if (emailController.text == doc['email'] &&
            passwordController.text == doc['password']) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
          prefs.setString('mechanicId', doc.id);
          Provider.of<LoginController>(context, listen: false)
              .isMechanicLoggedIn = true;
          ShowSnackbar().showSnackbar(
              context: context, content: "Logged in successfully");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreenMechanic(),
              ));
        } else {
          ShowSnackbar()
              .showSnackbar(content: "Unable to login", context: context);
        }
      });
    });
  }
}
