import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ACTIVITY",
            style: TextStyle(
              fontSize: 25,
              color: ColorConstants().txtColorWhite,
            ),
          ),
          forceMaterialTransparency: true,
        ),
        body: Row(
          children: [
            Column(
              children: [
                Text(
                  "past",
                  style: TextStyle(),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.info))
              ],
            ),
          ],
        ));
  }
}
