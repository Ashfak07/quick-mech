import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class WorkDetails extends StatefulWidget {
  const WorkDetails({super.key});

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstants.systemGrey)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 17),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.8,
                          child: Text(
                            "Elamakkara,Edapally,Ernakulam,Kerala,India",
                            style: TextStyleConstants.heading3,
                          ),
                        ),
                        Text(
                          'Username',
                          style: TextStyleConstants.heading5,
                        ),
                        Text(
                          'Location',
                          style: TextStyleConstants.heading5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Distance',
                                  style: TextStyle(
                                      color: ColorConstants.systemGrey),
                                ),
                                Text(
                                  '6 KM',
                                  style: TextStyleConstants.heading5,
                                ),
                              ],
                            ),
                            Container(
                              height: height * 0.05,
                              width: 1,
                              color: ColorConstants.systemGrey,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(
                                      color: ColorConstants.systemGrey),
                                ),
                                Text(
                                  '45 mins',
                                  style: TextStyleConstants.heading5,
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Text('2-wheeler',
                              style: TextStyle(
                                  color: ColorConstants.systemGrey,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Text(
                            'TVS Ntorq 2020',
                            style: TextStyleConstants.heading5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Container(
                                  width: width * 0.4,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: ColorConstants.primaryBlack)),
                                  child: Center(
                                    child: Text(
                                      'IGNORE',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 69, 69, 69),
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: width * 0.4,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: ColorConstants.bannerColor),
                                  child: Center(
                                    child: Text(
                                      'ACCEPT',
                                      style: TextStyle(
                                          color: ColorConstants.primaryWhite,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
