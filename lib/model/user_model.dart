import 'package:geolocator/geolocator.dart';

class UserModel {
  String? name;
  String? email;
  String? mobile;
  String? wtsapNmbr;
  String? image;
  Position? livesIn;
  Position? currentLocation;
  UserModel(
      {this.name,
      this.email,
      this.mobile, 
      this.wtsapNmbr,
      this.image,
      this.livesIn,
      this.currentLocation});
}
