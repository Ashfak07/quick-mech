import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:quickmech/utils/color_constants.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ACTIVITY",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('booking deatils')
                    .doc(user!.uid)
                    .collection('yourbooking')
                    .where('uid', isEqualTo: user!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          var recentbooking = snapshot.data!.docs[index];
                          print(recentbooking);
                          return Flexible(
                            child: ListTile(
                              title:
                                  Text(recentbooking['vehicledetails'] ?? 'hi'),
                            ),
                          );
                        });
                  } else {
                    Text('data');
                  }
                  return Text('nodata');
                }),
          ),
        ],
      ),
    );
  }
}
