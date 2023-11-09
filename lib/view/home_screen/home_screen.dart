import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quickmech/db/home_datas.dart';
import 'package:quickmech/utils/color_constants.dart';
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
  ScrollController _scrollController = ScrollController();
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
                    color: _isClicked == false ? Colors.white : Colors.black87,
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),

            SizedBox(
              height: Mediaheight * .03,
            ),
            Text('Category'),
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
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstants.bannerColor,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      _categorylist.category[index].image,
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                  Text(
                                    _categorylist.category[index].category,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ))),
            Divider(),
            Container(
              height: 378,
              child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: 16,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MechanicProfile(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstants.bannerColor),
                            child: Column(
                              children: [Icon(Icons.person)],
                            ),
                          ),
                        ),
                      )),

            backgroundColor: ColorConstants.bannerColor,
            expandedHeight: Mediaheight * .2,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: ColorConstants.bannerColor,
                    ),
                  ),
                  // SizedBox(
                  //   height: Mediaheight * .04,
                  // ),
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
                          labelText: 'Search'),
                    ),
                  ),
                ],
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
                      child: Text(
                        'Category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
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
                                          gradient: LinearGradient(colors: [
                                            ColorConstants.bannerColor,
                                            Colors.white,
                                          ])),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      )),
                                ))),
                    Divider(),
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
                                          gradient: LinearGradient(colors: [
                                            Colors.black.withOpacity(.6),
                                            Colors.black.withOpacity(.3)
                                          ]),
                                        ),
                                        child: Image.asset(
                                          _homeData.offerList[index].images,
                                          fit: BoxFit.cover,
                                        ));
                                  }),
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _homeData.offerList.length,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 12,
                                  child: Positioned(
                                    right: 3,
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
                              )
                            ],
                          )),
                    ),
                    Divider(),
                    Container(
                      height: Mediaheight * .4,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstants.bannerColor,
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            ColorConstants.bannerColor,
                                            Colors.white,
                                          ])),
                                  child: Column(
                                    children: [Icon(Icons.person)],
                                  ),
                                ),
                              )),
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
