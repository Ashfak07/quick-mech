import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/intro_screen/widgets/intro_screen1/intro_screen1.dart';
import 'package:quickmech/view/intro_screen/widgets/intro_screen2/intro_screen2.dart';
import 'package:quickmech/view/intro_screen/widgets/intro_screen3/intro_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller to keep track on which page we are on
    PageController _controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          // dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: ColorConstants.txtColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                // dot indicator
                SmoothPageIndicator(
                  controller: _controller, // PageController
                  count: 3,
                  effect: SwapEffect(
                      dotColor: ColorConstants.systemGrey,
                      activeDotColor: ColorConstants.bannerColor,
                      dotHeight: 10,
                      dotWidth: 10), // your preferred effect
                ),
                // next or done
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceIn);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                              color: ColorConstants.txtColorDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorConstants.txtColorDark,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
