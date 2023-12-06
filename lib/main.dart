import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickmech/controller/booking_controller/booking_controller.dart';
import 'package:quickmech/controller/fav_controller/fav_controller.dart';
import 'package:quickmech/controller/login_controller/login_controller.dart';
import 'package:quickmech/controller/mechanic_controller/mechanic_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/booking_page_controller/booking_page_controller.dart';
import 'package:quickmech/controller/mechanic_profile_controller/mechanic_profile_controller.dart';
import 'package:quickmech/utils/database/database_for%20_favourite.dart';
import 'package:quickmech/view/splash_screen/splash_screen.dart';

const saveKey = 'userlogedin';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCkkFrMmvVSaECRqKHIXioRNdUTI5e7QRE',
          appId: '1:349437087540:android:6acb04a0bf01db357a1f61',
          messagingSenderId: '',
          projectId: 'quickmech-7ab4d',
          storageBucket: 'quickmech-7ab4d.appspot.com'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MechanicController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MechanicProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingPageController(),
        ),
        Provider(create: (context) => FavouriteModel()),
        ChangeNotifierProxyProvider<FavouriteModel, FavouriterController>(
            create: (context) => FavouriterController(),
            update: ((context, CustomFavlist, favoiuritepage) {
              if (favoiuritepage == null)
                throw ArgumentError.notNull('favoiuritepage');
              favoiuritepage.favouritelist = CustomFavlist;
              return favoiuritepage;
            })),
        ChangeNotifierProvider(
          create: (context) => BookingController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorConstants.bannerColor),
            useMaterial3: true),
      ),
    );
  }
}
