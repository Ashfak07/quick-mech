import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  const PanelWidget(
      {super.key, required this.controller, required this.panelController});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 20,
        ),
        buildDragHandle(),
        SizedBox(
          height: 30,
        ),
        buildAboutText(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          ListTile(
            leading: CircleAvatar(radius: 25),
            title: Text(
              'Mechanic name',
              style: TextStyleConstants.heading4,
            ),
            subtitle: Text(
              '12.00 P.M 5 min away',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(color: ColorConstants.bannerColor),
            child: Center(
                child: Text(
              'Cancel Order',
              style: TextStyle(color: ColorConstants.primaryWhite),
            )),
          )
        ]),
      );

  Widget buildDragHandle() => GestureDetector(
        onTap: togglePanel,
        child: Center(
          child: Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();
}
