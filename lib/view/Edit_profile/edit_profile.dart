import 'package:flutter/material.dart';

class edit_profile extends StatelessWidget {
  const edit_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: CircleAvatar(
                radius: 60,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Change profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.edit)
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Mobile",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Save"))
        ],
      ),
    );
  }
}
