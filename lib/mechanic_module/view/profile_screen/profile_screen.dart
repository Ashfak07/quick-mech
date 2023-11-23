import 'package:flutter/material.dart';
import 'package:quickmech/mechanic_module/view/edit_profile/edit_profile.dart';

class MechanicprofileScreen extends StatelessWidget {
  const MechanicprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.grey[800],
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ));
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("profile"),
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 6,
                      shadowColor: Colors.black,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.ok20ZEluhnlQQzWG26XEnwHaHa?pid=ImgDet&rs=1"),
                                fit: BoxFit.fill),
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Cideep krishan",
                        style: TextStyle(fontSize: 20),
                      ),
                      Center(
                          child: Row(
                        children: [
                          Text(
                            "4.3",
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            child: Divider(
              thickness: 2,
              // height: 26,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("About"),
            subtitle: Text(
                "Mechanics are service technicians responsible for inspecting and repairing vehicles and machinery. If you have an affinity and passion  role can help you un mechanic."),
          )
        ],
      ),
    );
  }
}
