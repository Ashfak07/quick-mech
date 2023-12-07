import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quickmech/controller/location_controller/location_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MechanicProfileController with ChangeNotifier {
  var currentLocation = LocationController().determinePosition();
  var error;
  var distanceBetween;
  var distanceInKm;
  var roundDistanceInKM;
  void callMechanic() async {
    if (!await launchUrl(Uri(scheme: 'tel', path: '7558095349'))) {
      throw ('Could not launch ${Uri(scheme: 'tel', path: '7558095349')}');
    }
    notifyListeners();
  }

  void callCustomerService() async {
    if (!await launchUrl(Uri(scheme: 'tel', path: '0123456789'))) {
      throw ('Could not launch ${Uri(scheme: 'tel', path: '0123456789')}');
    }
    notifyListeners();
  }

  void launchWhatsapp({required number, required name}) async {
    String message =
        'Hi, I am $name. I need urgent roadside assistance. Please help me.';
    String url = "whatsapp://send?phone=$number&text=$message";
    if (!await launchUrl(Uri.parse(url))) {
      throw ('Can\'t open whatsapp');
    }
    notifyListeners();
  }

  getDistanceBetween(mechanicDetails) async {
    distanceBetween = await Geolocator.distanceBetween(
        mechanicDetails.currentLocation.latitude,
        mechanicDetails.currentLocation.longitude,
        currentLocation.latitude,
        currentLocation.longitude);
    distanceInKm = await distanceBetween / 1000;
    roundDistanceInKM = await double.parse((distanceInKm).toStringAsFixed(2));
    notifyListeners();
  }
}
