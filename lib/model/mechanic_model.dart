class MechanicModel {
    String? name;
    String? location;
    CurrentLocation? currentLocation;
    String? status;
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
        this.status,
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
        status: json["status"],
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
        "status": status,
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
    double? latitude;
    double? longitude;

    CurrentLocation({
        this.latitude,
        this.longitude,
    });

    factory CurrentLocation.fromJson(Map<String, dynamic> json) => CurrentLocation(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
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
    double? rated;

    Review({
        this.name,
        this.dateTime,
        this.content,
        this.rated,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json["name"],
        dateTime: json["dateTime"],
        content: json["content"],
        rated: json["rated"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "dateTime": dateTime,
        "content": content,
        "rated": rated,
    };
}
