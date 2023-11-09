import 'package:flutter/material.dart';
import 'package:quickmech/view/profile_screen/widget/contact%20_support_screen/contact%20_support_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'John',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '9658232520',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.messenger_outline_rounded),
                  title: Text(
                    'Messages',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.account_balance_wallet_rounded),
                  title: Text(
                    'Account points',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Privacy and policy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Contact support',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactSupportScreen(),
                      ));
                    },
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'About us',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
