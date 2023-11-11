class MechanicModel {
    String? name;
    String? location;
    CurrentLocation? currentLocation;
    String? age;
    String? image;
    String? contactNumber;
    String? whatsappNbr;
    String? description;
    List<Review>? reviews;
    String? rating;

    MechanicModel({
        this.name,
        this.location,
        this.currentLocation,
        this.age,
        this.image,
        this.contactNumber,
        this.whatsappNbr,
        this.description,
        this.reviews,
        this.rating,
    });

    factory MechanicModel.fromJson(Map<String, dynamic> json) => MechanicModel(
        name: json["name"],
        location: json["location"],
        currentLocation: json["current_location"] == null ? null : CurrentLocation.fromJson(json["current_location"]),
        age: json["age"],
        image: json["image"],
        contactNumber: json["contact number"],
        whatsappNbr: json["whatsapp nbr"],
        description: json["description"],
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "current_location": currentLocation?.toJson(),
        "age": age,
        "image": image,
        "contact number": contactNumber,
        "whatsapp nbr": whatsappNbr,
        "description": description,
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "rating": rating,
    };
}

class CurrentLocation {
    String? latitude;
    String? longitude;

    CurrentLocation({
        this.latitude,
        this.longitude,
    });

    factory CurrentLocation.fromJson(Map<String, dynamic> json) => CurrentLocation(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Review {
    String? name;
    String? dateTime;
    String? content;

    Review({
        this.name,
        this.dateTime,
        this.content,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json["name"],
        dateTime: json["dateTime"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "dateTime": dateTime,
        "content": content,
    };
}
