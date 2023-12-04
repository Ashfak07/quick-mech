
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickmech/main.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/database/user_db.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/Edit_profile/edit_profile.dart';
import 'package:quickmech/view/choose_login_type/choose_login_type.dart';
import 'package:quickmech/view/profile_screen/screens/about_us_screen/about_us_screen.dart';
import 'package:quickmech/view/profile_screen/screens/contact%20_support_screen/contact%20_support_screen.dart';
import 'package:quickmech/view/profile_screen/screens/terms_and_conditions_screen/terms_and_conditions_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.index});
  final index;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    setState(() {});

    getdata();
  }

  String? username;
  String? email;
  String? mobile;

  void getdata() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final _uid = user!.uid;
    final DocumentSnapshot userdoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (userdoc == null) {
      return;
    } else {
      setState(() {});
      username = userdoc.get('userName');
      email = userdoc.get('email');
      mobile = userdoc.get('mobile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            UserData[0].image.toString(),
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                  height: 150,
                  width: 150,
                ),
                Positioned(
                    bottom: -5,
                    right: -5,
                    child: CircleAvatar(
                      radius: 19,
                      backgroundColor: ColorConstants.primaryWhite,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: ColorConstants.systemGrey,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => edit_profile(),
                            ));
                          },
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: ColorConstants.primaryBlack,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            userListTile(username.toString(), 0, context),
            userListTile(mobile.toString(), 1, context),
            Text(
              UserData[0].email.toString(),
              style: TextStyleConstants.heading5,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: ColorConstants.bannerColor,
                child: Column(
                  children: [
                    ListTile(
                        leading: Icon(
                          Icons.messenger_outline_rounded,
                          color: ColorConstants.primaryBlack,
                        ),
                        title: Text(
                          'Messages',
                          style: TextStyleConstants.heading3,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstants.primaryBlack,
                          ),
                        )),
                    Divider(
                      thickness: 2,
                      color: ColorConstants.primaryWhite,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: ColorConstants.primaryBlack,
                        ),
                        title: Text(
                          'Account points',
                          style: TextStyleConstants.heading3,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstants.primaryBlack,
                          ),
                        )),
                    Divider(
                      thickness: 2,
                      color: ColorConstants.primaryWhite,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.description_outlined,
                          color: ColorConstants.primaryBlack,
                        ),
                        title: Text(
                          'Terms and conditions',
                          style: TextStyleConstants.heading3,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TermsAndConditionsScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstants.primaryBlack,
                          ),
                        )),
                    Divider(
                      thickness: 2,
                      color: ColorConstants.primaryWhite,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.contact_support_outlined,
                          color: ColorConstants.primaryBlack,
                        ),
                        title: Text(
                          'Contact support',
                          style: TextStyleConstants.heading3,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ContactSupportScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstants.primaryBlack,
                          ),
                        )),
                    Divider(
                      thickness: 2,
                      color: ColorConstants.primaryWhite,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: ColorConstants.primaryBlack,
                        ),
                        title: Text(
                          'About us',
                          style: TextStyleConstants.heading3,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutUsScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstants.primaryBlack,
                          ),
                        )),
                    Divider(
                      thickness: 2,
                      color: ColorConstants.primaryWhite,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: ColorConstants.primaryBlack,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyleConstants.heading3,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('LOGOUT!'),
                                  content:
                                      const Text('Do you want to logout ?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        logOut(context);
                                        // Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           LoginScreen(),
                                        //     ),
                                        //     (route) => false);
                                      },
                                      child: const Text('YES'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('NO'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstants.primaryBlack,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  Widget userListTile(String title, int index, BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }

  logOut(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ChooseLoginType()),
        (Route) => false);
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setBool(saveKey, false);
  }
}
