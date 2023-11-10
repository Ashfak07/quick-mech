import 'package:flutter/material.dart';

import 'package:quickmech/utils/color_constants.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/booking_page_controller/booking_page_controller.dart';
import 'package:quickmech/controller/mechanic_profile_controller/mechanic_profile_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';
import 'package:quickmech/view/splash_screen/splash_screen.dart';
import 'package:quickmech/view/booking_page/booking_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MechanicProfileController(),),
        ChangeNotifierProvider(create: (context) => BookingPageController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorConstants.bannerColor),
            useMaterial3: true),

      ),
    );



  }
}
