import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class MechanicProfileScreen extends StatefulWidget {
  const MechanicProfileScreen({super.key});

  @override
  State<MechanicProfileScreen> createState() => _MechanicprofileScreenState();
}

class _MechanicprofileScreenState extends State<MechanicProfileScreen> {
  // Initial Selected Value
  String? selectedValue;

  // List of items in our dropdown menu
  var items = [
    '2 - wheeler',
    '4 - wheeler',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Column(
                  //     children: [
                  //       TextField(
                  //         decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             hintText: "Cideep Krishnan"),
                  //       ),
                  //       Center(
                  //           child: Row(
                  //         children: [
                  //           Text(
                  //             "4.3",
                  //             style: TextStyle(
                  //                 color: Colors.amber,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           Icon(
                  //             Icons.star,
                  //             color: Colors.amber,
                  //           )
                  //         ],
                  //       ))
                  //     ],
                  //   ),
                  // ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.systemGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.systemGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "email",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.systemGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile Number",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.systemGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Whatsapp Number",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.systemGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select category',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.bannerColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    'SAVE DETAILS',
                    style: TextStyle(color: ColorConstants.primaryWhite),
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
