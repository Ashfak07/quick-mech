import 'package:flutter/material.dart';

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
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hey, Flutter',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 40,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        'Payment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        'Activity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        'Help',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  'Messages',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  'Register as mechanic',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  'Account points',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(''),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
