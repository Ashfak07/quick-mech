import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/db/home_datas.dart';
import 'package:quickmech/view/home_screen/item.dart';
import 'package:quickmech/view/mechanic_profile_page/mechanic_profile_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeData _homeData = HomeData();
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (CurrentPage < 3) {
        CurrentPage++;
      } else {
        CurrentPage = 0;
      }
      _pageController.animateToPage(CurrentPage,
          duration: Duration(microseconds: 350), curve: Curves.easeIn);
    });
    @override
    void dispose() {
      super.dispose();
      _timer?.cancel();
    }
  }

  Categorylist _categorylist = Categorylist();
  // ScrollController _scrollController = ScrollController();
  bool _isClicked = false;
  int index = 0;
  PageController _pageController = PageController(initialPage: 0);
  var pageindi;
  int CurrentPage = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    var Mediaheight = MediaQuery.sizeOf(context).height;
    var Mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            pinned: true,
            actions: [
              InkWell(
                  onTap: () {
                    // if (index % 2 == 0) {
                    //   _isClicked = true;
                    // } else {
                    //   _isClicked = false;
                    // }
                    // index = index + 1;
                    // setState(() {});
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 40,
              ),
              Icon(Icons.location_on_outlined),
              SizedBox(
                width: 20,
              ),
            ],
            title: Text(
              'QUICK MECH',
              style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            backgroundColor: ColorConstants.bannerColor,
            expandedHeight: Mediaheight * .2,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Align(
                    //     alignment: Alignment.topLeft,
                    //     child: AnimatedTextKit(
                    //       repeatForever: true,
                    //       animatedTexts: [
                    //         WavyAnimatedText(
                    //           'GoodMorning...',
                    //           textStyle: GoogleFonts.courgette(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15),
                    //         ),
                    //       ],
                    //     )),
                    SizedBox(
                      height: Mediaheight * .08,
                    ),
                    Container(
                      height: Mediaheight * .05,
                      width: Mediawidth * .7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList.list(children: [
            SingleChildScrollView(
              primary: true,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: Mediaheight * .03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 200,
                          width: Mediawidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorConstants.bannerColor),
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              PageView.builder(
                                  itemCount: _homeData.offerList.length,
                                  controller: _pageController,
                                  onPageChanged: (value) {
                                    pageindi = value;
                                    setState(() {});
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all()
                                            // gradient: LinearGradient(colors: [
                                            //   Colors.black.withOpacity(.6),
                                            //   Colors.black.withOpacity(.3)
                                            // ]),
                                            ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            _homeData.offerList[index].images,
                                            fit: BoxFit.cover,
                                          ),
                                        ));
                                  }),
                              Positioned.fill(
                                left: 150,
                                child: Container(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _homeData.offerList.length,
                                    itemBuilder: (context, index) => SizedBox(
                                      width: 12,
                                      child: Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: CircleAvatar(
                                            radius: pageindi == index ? 6 : 3,
                                            backgroundColor: pageindi == index
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Category',
                            style: GoogleFonts.josefinSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                    Container(
                        height: 120,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _categorylist.category.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: Mediawidth * .3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ColorConstants.bannerColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(9.0, 9), //(x,y)
                                              blurRadius: 6.0,
                                            )
                                          ]),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              _categorylist
                                                  .category[index].image,
                                              fit: BoxFit.cover,
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            _categorylist
                                                .category[index].category,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                ))),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Our partners',
                            style: GoogleFonts.josefinSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MechanicProfile()));
                      },
                      child: Container(
                        height: Mediaheight * .4,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(4.0, 4), //(x,y)
                                              blurRadius: 6.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ColorConstants.primaryWhite,
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                  'assets/images/images (5).jpg'),
                                            ),
                                            Text('NAME'),
                                            Text('RATING')
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  if (index % 2 == 0) {
                                                    _isClicked = true;
                                                  } else {
                                                    _isClicked = false;
                                                  }
                                                  index = index + 1;
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  _isClicked == false
                                                      ? Icons.favorite_outline
                                                      : Icons.favorite,
                                                  color: _isClicked == false
                                                      ? ColorConstants
                                                          .primaryWhite
                                                      : Colors.red,
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: Mediaheight * .1,
                    ),
                  ],
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
