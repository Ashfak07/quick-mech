import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:quickmech/mechanic_module/view/homescreen/widgets/panel_form/panel_form.dart';
import 'package:quickmech/mechanic_module/view/profile_screen/profile_screen.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/constants/image_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/choose_login_type/choose_login_type.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreenMechanic extends StatefulWidget {
  const HomeScreenMechanic({super.key});

  @override
  State<HomeScreenMechanic> createState() => _HomeScreenMechanicState();
}

class _HomeScreenMechanicState extends State<HomeScreenMechanic> {
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.secondaryWhite,
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MechanicProfileScreen(),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.4,
                          child: Text(
                            'Mechanic Name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: ColorConstants.bannerColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Duty Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: SizedBox(
              width: 100,
              child: FlutterSwitch(
                activeText: "Online",
                activeColor: ColorConstants.bannerColor,
                inactiveText: "Offline",
                value: _isOnline,
                valueFontSize: 12,
                toggleSize: 20,
                width: 80,
                height: 40,
                borderRadius: 25.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    _isOnline = val;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.notifications_outlined),
                      title: Text('Notifications'),
                    ),
                    ListTile(
                      leading: Icon(Icons.history_outlined),
                      title: Text('History'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings_outlined),
                      title: Text('Settings'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseLoginType(),
                            ));
                      },
                      child: ListTile(
                        title: Text(
                          'Logout',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: Icon(Icons.logout_outlined),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
      appBar: AppBar(
        backgroundColor: ColorConstants.bannerColor,
        toolbarHeight: height * 0.11,
        titleSpacing: .01,
        iconTheme: IconThemeData(color: ColorConstants.primaryWhite),
        elevation: 5,
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.3,
              height: height * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.logo_white))),
            )),
      ),
      // body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //   Center(
      //     child: Container(
      //       height: height * 0.2,
      //       width: width * 0.5,
      //       decoration: BoxDecoration(
      //           color: ColorConstants.systemGrey,
      //           borderRadius: BorderRadius.circular(15)),
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text(
      //       'You are online',
      //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(4),
      //     child: Text('Waiting for new orders',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      //   ),
      // ]),
      body: Stack(
        children: [
          SlidingUpPanel(
            minHeight: height * 0.3,
            maxHeight: height * 0.8,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            defaultPanelState: PanelState.OPEN,
            parallaxEnabled: true,
            parallaxOffset: .5,
            backdropEnabled: true,
            panelBuilder: (sc) => PanelForm(),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Incoming Bookings',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: height * 0.45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorConstants.systemGrey)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Elamakkara,Edapally,Ernakulam,Kerala,India",
                                        style: TextStyleConstants.heading3,
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: width * 0.4,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color:
                                                  ColorConstants.primaryBlack)),
                                      child: Center(
                                        child: Text(
                                          'IGNORE',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 69, 69, 69),
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
                                              color:
                                                  ColorConstants.primaryWhite,
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
                  ),
                ),
              ))
            ]),
          )
        ],
      ),
    );
  }
}
