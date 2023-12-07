import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/location_controller/location_controller.dart';
import 'package:quickmech/controller/login_controller/login_controller.dart';
import 'package:quickmech/controller/mechanic_profile_controller/mechanic_profile_controller.dart';
import 'package:quickmech/mechanic_module/controller/profile_controller/profile_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/common/snackbar/snackbar_screen.dart';

class PanelForm extends StatefulWidget {
  const PanelForm({super.key});

  @override
  State<PanelForm> createState() => _PanelFormState();
}

class _PanelFormState extends State<PanelForm> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();

  // Initial Selected Value
  String? selectedValue;

  // List of items in our dropdown menu
  var items = [
    '2 - wheeler',
    '4 - wheeler',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Details',
                style: GoogleFonts.robotoCondensed(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ],
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
                controller: fullNameController,
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
                controller: mobileController,
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
                controller: whatsappController,
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
                      fontSize: 16,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 16,
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
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    height: 50,
                    width: MediaQuery.sizeOf(context).width * 0.6,
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
          child: InkWell(
            onTap: () {
              final mechanic_id =
                  Provider.of<LoginController>(context, listen: false)
                      .mechanicId;
              final location = LocationController().determinePosition();
              if (!location.isSuccessful()) {
                ProfileController().addDetails(
                    mechanicId: mechanic_id.toString(),
                    fullName: fullNameController.text,
                    mobile: mobileController.text,
                    whatsapp: whatsappController.text,
                    category: selectedValue.toString(),
                    currentLocation: location);
                ShowSnackbar().showSnackbar(
                    context: context, content: "Details added successfully");
              }
            },
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
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
