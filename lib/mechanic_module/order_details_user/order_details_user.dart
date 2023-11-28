import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class OrderDetailsUser extends StatefulWidget {
  const OrderDetailsUser({super.key});

  @override
  State<OrderDetailsUser> createState() => _OrderDetailsUserState();
}

class _OrderDetailsUserState extends State<OrderDetailsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: 400,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                height: 10,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ColorConstants.bannerColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                      width: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Reaching at time, 5 minutes.',
                  style: TextStyleConstants.heading3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Coustomer name : ',
                                style: TextStyleConstants.heading3,
                              ),
                              Text(
                                'Arun',
                                style: TextStyleConstants.heading3,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Category : ',
                            style: TextStyleConstants.heading3,
                          ),
                          Text(
                            '2 Wheeler',
                            style: TextStyleConstants.heading5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Company : ',
                            style: TextStyleConstants.heading3,
                          ),
                          Text(
                            'royal enfield',
                            style: TextStyleConstants.heading5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Model name : ',
                            style: TextStyleConstants.heading3,
                          ),
                          Text(
                            'Himalayan 450',
                            style: TextStyleConstants.heading5,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Model year : ',
                            style: TextStyleConstants.heading3,
                          ),
                          Text(
                            '2015',
                            style: TextStyleConstants.heading5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: ColorConstants.bannerColor,
                    onPressed: () {},
                    child: Icon(Icons.call),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
