import 'package:geolocator/geolocator.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? wtsapNmbr;
  String? image;
  Position? livesIn;
  Position? currentLocation;
  UserModel.register({
    required this.email,
    required this.password,
    required this.mobile,
  });
  UserModel.addDetails(
      {this.name,
      this.email,
      this.password,
      this.mobile,
      this.wtsapNmbr,
      this.image,
      this.livesIn,
      this.currentLocation});
}
