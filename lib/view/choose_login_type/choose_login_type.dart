import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmech/mechanic_module/view/login_screen/login_screen.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/choose_login_type/widgets/page1/page1.dart';
import 'package:quickmech/view/choose_login_type/widgets/page2/page2.dart';
import 'package:quickmech/view/choose_login_type/widgets/page3/page3.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ChooseLoginType extends StatefulWidget {
  const ChooseLoginType({super.key});

  @override
  State<ChooseLoginType> createState() => _ChooseLoginTypeState();
}

class _ChooseLoginTypeState extends State<ChooseLoginType> {
  bool onLastPage = false;
  List pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    bool userLoginType;
    final mediaSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          // PageView(
          //   controller: _controller,
          //   onPageChanged: (index) {
          //     setState(() {
          //       onLastPage = (index == 2);
          //     });
          //   },
          //   children: [
          //     Page1(),
          //     Page2(),
          //     Page3(),
          //   ],
          // ),
          // Carousal
          CarouselSlider.builder(
              itemCount: pages.length,
              itemBuilder: (context, index, realIndex) => pages[index],
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1))),
      
          // dot indicators
          // Container(
          //   alignment: Alignment(0, 0.40),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       // dot indicator
          //       SmoothPageIndicator(
          //         controller: _controller, // PageController
          //         count: 3,
          //         effect: SwapEffect(
          //             dotColor: ColorConstants.systemGrey,
          //             activeDotColor: ColorConstants.bannerColor,
          //             dotHeight: 10,
          //             dotWidth: 10), // your preferred effect
          //       ),
          //     ],
          //   ),
          // ),
          // bottomsheet
          SlidingUpPanel(
            minHeight: mediaSize.height * 0.2,
            maxHeight: mediaSize.height * 0.2,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            defaultPanelState: PanelState.OPEN,
            panelBuilder: (sc) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(235, 11, 11, 71),
                        Color.fromARGB(235, 11, 11, 59),
                      ])),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Login as user
                        InkWell(
                          onTap: () {
                            userLoginType = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen(userLoginType: userLoginType),
                                ));
                          },
                          child: Container(
                            width: mediaSize.width * 0.4,
                            height: mediaSize.width * 0.12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: ColorConstants.bannerColor),
                            child: Center(
                              child: Text(
                                'Login as User',
                                style: GoogleFonts.karla(
                                    color: Color.fromARGB(
                                      236,
                                      18,
                                      18,
                                      80,
                                    ),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        // Login as mechanic
                        InkWell(
                          onTap: () {
                            userLoginType = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreenMechanic(userLoginType: userLoginType),
                                ));
                          },
                          child: Container(
                            width: mediaSize.width * 0.4,
                            height: mediaSize.width * 0.12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: ColorConstants.bannerColor),
                                color: Color.fromARGB(236, 18, 18, 80)),
                            child: Center(
                              child: Text(
                                'Login as Mechanic',
                                style: GoogleFonts.karla(
                                    color: ColorConstants.primaryWhite,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
