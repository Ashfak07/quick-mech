import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SplashScreen(),
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.bgColorWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "quick mech",
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ));
  }
}
