import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quickmech/controller/location_controller/location_controller.dart';
import 'package:quickmech/mechanic_module/view/login_screen/login_screen.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/common/snackbar/snackbar_screen.dart';
import 'package:quickmech/view/firebase_auth_implimentation/fire_base_auth.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';

class RegistrationScreenMechanic extends StatefulWidget {
  final bool userLoginType;
  const RegistrationScreenMechanic({super.key, required this.userLoginType});

  @override
  State<RegistrationScreenMechanic> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreenMechanic> {
  bool _isSecurePassword = true;
  final FirebaseAuthServices auth = FirebaseAuthServices();
  // RegistrationController registrationController = RegistrationController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  FocusNode fieldFour = FocusNode();
  FocusNode fieldFive = FocusNode();

  // Initial Selected Value
  String? selectedValue;

  // List of items in our dropdown menu
  var items = [
    '2 - wheeler',
    '4 - wheeler',
  ];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // var mediaheight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: ColorConstants.bannerColor),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      focusNode: fieldOne,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldTwo);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('Required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: fullNameController,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      focusNode: fieldTwo,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldThree);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Full Name',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: mobileController,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      focusNode: fieldThree,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldThree);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Mobile Number',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: whatsappController,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      focusNode: fieldFour,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldFour);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Whatsapp Number',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      focusNode: fieldFive,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: togglePassword()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('required');
                        } else {
                          return null;
                        }
                      },
                      obscureText: _isSecurePassword,
                    ),
                  ],
                ),
              ),
              // Select category
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.systemGrey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2<String>(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenMechanic(
                                      userLoginType: widget.userLoginType,
                                    )));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                        child: Text(
                          'Already have account',
                          style: TextStyle(fontSize: mediawidth * .03),
                        ),
                      )),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                child: InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    child: Center(
                      child: Text(
                        "Sign Up",
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
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }

  void signUp() async {
    CollectionReference mechanics =
        FirebaseFirestore.instance.collection('mechanicCredentials');
    Position currentLocation = await LocationController().determinePosition();
    await mechanics.add({
      'email': emailController.text,
      'password': passwordController.text,
      'fullName': fullNameController.text,
      'mobile': mobileController.text,
      'whatsapp': whatsappController.text,
      'category': selectedValue,
      'isOnline': false,
      'currentLocation': currentLocation.toJson(),
    }).then((value) {
      ShowSnackbar().showSnackbar(
          context: context, content: 'Registered as a mechanic successfully');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LoginScreenMechanic(userLoginType: widget.userLoginType),
          ));
    }).catchError((error) {
      print(error.toString());
      ShowSnackbar()
          .showSnackbar(context: context, content: 'Failed to register');
    });
  }
}
