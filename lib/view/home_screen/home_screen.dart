import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/home_screen/item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Categorylist _categorylist = Categorylist();
  ScrollController _scrollController = ScrollController();
  bool _isClicked = false;
  int index = 0;
  PageController _pageController = PageController(initialPage: 0);
  var pageindi;

  @override
  Widget build(BuildContext context) {
    var Mediaheight = MediaQuery.sizeOf(context).height;
    var Mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leadingWidth: Mediawidth * .6,
        title: Text(
          'QUICK MECH',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(20),
        //         bottomRight: Radius.circular(20))),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: Mediaheight * .04,
            ),
            Container(
              height: Mediaheight * .05,
              width: Mediawidth * .8,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                enableInteractiveSelection: true,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: Mediaheight * .03,
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
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.bannerColor),
                          child: Column(
                            children: [Icon(Icons.person)],
                          ),
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: Mediawidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.bannerColor),
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        pageindi = value;
                        setState(() {});
                      },
                      children: [
                        Container(
                          color: Colors.yellow,
                          child: Text('con 1'),
                        ),
                        Container(
                          color: Colors.red,
                          child: Text('con 1'),
                        ),
                        Container(
                          color: Colors.green,
                          child: Text('con 1'),
                        ),
                        Container(
                          color: Colors.lime,
                          child: Text('con 1'),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Positioned(
                        bottom: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 7,
                                backgroundColor:
                                    pageindi == 0 ? Colors.blue : Colors.white,
                              ),
                              CircleAvatar(
                                radius: 7,
                                backgroundColor:
                                    pageindi == 1 ? Colors.blue : Colors.white,
                              ),
                              CircleAvatar(
                                radius: 7,
                                backgroundColor:
                                    pageindi == 2 ? Colors.blue : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Mediaheight * .1,
            ),
          ],
        ),
      ),
    );
  }
}
