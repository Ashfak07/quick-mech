import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  bool sheduledbooking=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Mechanic"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: Row(
                children: [
                  GestureDetector(onTap: () {
                    setState(() {
                      sheduledbooking=false;
                    });
                  },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13)),
                        height: 50,
                        width: 150,
                        child: Center(
                          child: Text(
                            "Instant Booking",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(onTap: () {
                    setState(() {
                      sheduledbooking=true;
                    });
                  },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13)),
                        height: 50,
                        width: 150,
                        child: Center(
                          child: Text(
                            "Scheduled Booking",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),sheduledbooking==true?
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Time Peroid",
                    style: TextStyleConstants.heading3,
                  ),
                ),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "From",
                    style: TextStyleConstants.heading5,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "From",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "To",
                    style: TextStyleConstants.heading5,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "To",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
              ],
            ):Container(),
           
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Location",
                style: TextStyleConstants.heading3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Current location",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {},
                            child: Text("Change")),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Add message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: Card(
                elevation: 10,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorConstants.bannerColor,
                      borderRadius: BorderRadius.circular(13)),
                  child: Center(
                      child: Text("Book",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
