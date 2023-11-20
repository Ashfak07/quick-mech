class ProfileModel {
  String? name;
  String? email;
  String? mobile;
  String? image;
  ProfileModel({this.name, this.email, this.mobile, this.image});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "image": image,
      };
}
