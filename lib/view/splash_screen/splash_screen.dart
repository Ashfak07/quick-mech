import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmech/main.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:quickmech/view/choose_login_type/choose_login_type.dart';
import 'package:quickmech/view/home_screen/home_screen.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoged();
    super.initState();
    // Future.delayed(Duration(seconds: 3))
    //     .then((value) => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => ChooseLoginType(),
    //         )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.primaryWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'QUICK MECH',
              style: GoogleFonts.orbitron(
                  color: ColorConstants.bannerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ));
  }

  Future<void> checkUserLoged() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userloged = await sharedpref.get(savekey);
    if (userloged == null || userloged == false) {
      gotologin();
    } else {
      splashwait();
    }
  }

  gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ChooseLoginType()));
  }

  splashwait() async {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNavBar())));
  }
}
