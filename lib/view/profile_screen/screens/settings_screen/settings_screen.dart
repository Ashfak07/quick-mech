import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bannerColor,
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          Card()
        ],
      ),
    );
  }
}
