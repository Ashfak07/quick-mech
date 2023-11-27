import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/order_details_page/widgets/panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final panelController = PanelController();
  static const double fabheightClosed = 116.0;
  double fabHeight = fabheightClosed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final panelHeightOpen = height * 0.28;
    final panelHeightClosed = height * 0.06;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "order ID- 00000",
              style: TextStyleConstants.heading3,
            ),
            Text(
              '11.47 A.M',
              style: TextStyle(color: ColorConstants.systemGrey, fontSize: 14),
            )
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
              minHeight: panelHeightClosed,
              maxHeight: panelHeightOpen,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              defaultPanelState: PanelState.OPEN,
              parallaxEnabled: true,
              parallaxOffset: .5,
              controller: panelController,
              body: Container(
                height: height * 0.85,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.google.com/maps/d/thumbnail?mid=1pX4qfuilVhhLxQuuYI_O1KFhXoc&hl=en'),
                      fit: BoxFit.cover),
                ),
              ),
              panelBuilder: (sc) =>
                  PanelWidget(controller: sc, panelController: panelController),
              onPanelSlide: (position) => setState(() {
                    final panelMaxScrollExtent =
                        panelHeightOpen - panelHeightClosed;
                    fabHeight =
                        position * panelMaxScrollExtent + fabheightClosed;
                  })),
          Positioned(
              right: 20, bottom: fabHeight, child: buildFabContext(context))
        ],
      ),
    );
  }

  Widget buildFabContext(BuildContext context) => FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        onPressed: () {},
        child: Icon(Icons.call),
      );
}
