import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class MechanicProfile extends StatefulWidget {
  const MechanicProfile({super.key});

  @override
  State<MechanicProfile> createState() => _MechanicProfileState();
}

class _MechanicProfileState extends State<MechanicProfile> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * .35,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1699511437~exp=1699512037~hmac=0ae02ad49c3a84694770a5aee1867466e40f30f5f95b137a7e15e3159783d6b4'),
                        fit: BoxFit.cover),
                  ),
                ),
                titlePadding: EdgeInsets.all(0),
                title: Container(
                  height: 80,
                  width: double.infinity,
                  color: const Color.fromARGB(181, 0, 0, 0),
                  child: ListTile(
                    title: Text(
                      'Mechanic Name',
                      style: GoogleFonts.robotoSlab(
                          color: ColorConstants.txtColorDark, fontSize: 18),
                    ),
                    subtitle: Text(
                      '6 km away',
                      style: TextStyle(
                          color: ColorConstants.systemGrey, fontSize: 12),
                    ),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConstants.bannerColor),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.3',
                                    style: TextStyle(
                                        color: ColorConstants.txtColorDark),
                                  ),
                                  Icon(Icons.star,
                                      size: 14,
                                      color: ColorConstants.txtColorDark)
                                ]),
                          )
                        ]),
                  ),
                )),
          ),
          SliverList.list(children: [
            Container(
                color: ColorConstants.systemGrey,
                width: double.infinity,
                height: 80,
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on,
                      size: 30,
                      color: ColorConstants.bannerColor,
                    ),
                    title: Text(
                      'Ernakulam,Kochi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    trailing: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.share,
                              size: 26,
                              color: ColorConstants.bannerColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.bookmark,
                              size: 30,
                              color: ColorConstants.bannerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      // Category
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Center(
                                child: Icon(
                              Icons.category,
                              color: ColorConstants.txtColorDark,
                            )),
                          ),
                          title: Text(
                            'Category',
                            style: TextStyleConstants.heading5,
                          ),
                          subtitle: Text('2 wheeler')
                        ),
                      ),
                      // Age
                       Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Center(
                                child: Icon(
                              Icons.man,
                              color: ColorConstants.txtColorDark,
                            )),
                          ),
                          title: Text(
                            'Age',
                            style: TextStyleConstants.heading5,
                          ),
                          subtitle: Text('30')
                        ),
                      ),
                      // Lives in
                       Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Center(
                                child: Icon(
                              Icons.house,
                              color: ColorConstants.txtColorDark,
                            )),
                          ),
                          title: Text(
                            'Lives In',
                            style: TextStyleConstants.heading5,
                          ),
                          subtitle: Text('Ernakulam, Kochi')
                        ),
                      ),
                      // Contact details
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Center(
                                child: Icon(
                              Icons.phone,
                              color: ColorConstants.txtColorDark,
                            )),
                          ),
                          title: Text(
                            'Contact Details',
                            style: TextStyleConstants.heading5,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  FaIcon(FontAwesomeIcons.whatsapp,size: 20,),
                                  Text('WhatsApp')
                                ],),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  FaIcon(FontAwesomeIcons.phone,size: 20,),
                                  Text('Call Now')
                                ],),
                              ),
                            )
                          ]),
                        ),
                      ),
                      
                    ],
                  )),
            ),
            // Description
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text('Description', style: TextStyleConstants.heading3),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(fontSize: 16, height: 2),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.systemGrey,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.chat,
                            color: ColorConstants.txtColorDark,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            'Chat',
                            style: TextStyle(
                                color: ColorConstants.txtColorDark,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Book',
                      style: TextStyle(
                          color: ColorConstants.txtColorDark, fontSize: 16),
                    )),
                  )
                ],
              ),
            ),

            // Reviews
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Reviews', style: TextStyleConstants.heading3),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Abhishek B Ambady',
                                style: TextStyle(
                                    color: ColorConstants.txtColorWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '2h ago',
                              style: TextStyle(
                                  color: ColorConstants.systemGrey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            // Give feedback
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Write Reviews...',
                              border: InputBorder.none),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PannableRatingBar(
                            rate: rating,
                            items: List.generate(
                                5,
                                (index) => RatingWidget(
                                      selectedColor: ColorConstants.bannerColor,
                                      unSelectedColor: Colors.grey,
                                      child: Icon(
                                        Icons.star,
                                        size: 40,
                                      ),
                                    )),
                            onChanged: (value) {
                              // the rating value is updated on tap or drag.
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: ColorConstants.bannerColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: ColorConstants.txtColorDark),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),
          ]),
        ],
      ),
    );
  }
}