import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';

class ChooseLoginType extends StatelessWidget {
  const ChooseLoginType({super.key});

  @override
  Widget build(BuildContext context) {
    late bool userLoginType;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                userLoginType = true;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                              userLoginType: userLoginType,
                            )));
              },
              child: Container(
                width: 163,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.9, 5),
                          blurRadius: 6.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstants.bannerColor)),
                child: Center(
                    child: Text('Login as user',
                        style: TextStyleConstants.heading3)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                userLoginType = false;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                              userLoginType: userLoginType,
                            )));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.9, 5),
                          blurRadius: 6.0)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstants.bannerColor)),
                child:
                    Text('Login as worker', style: TextStyleConstants.heading3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
