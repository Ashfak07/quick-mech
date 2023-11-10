import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bannerColor,
        title: Text('ContactSupport'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.bgColorWhite,
                    borderRadius: BorderRadius.circular(20)),
                height: 70,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: ColorConstants.bannerColor,
                          child: Icon(
                            Icons.call,
                            color: ColorConstants.bgColorWhite,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our 24X7 Customer Service',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '0123456789',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.bgColorWhite,
                    borderRadius: BorderRadius.circular(20)),
                height: 70,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: ColorConstants.bannerColor,
                          child: Icon(
                            Icons.email,
                            color: ColorConstants.bgColorWhite,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Write us at',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'hi@gmial.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
