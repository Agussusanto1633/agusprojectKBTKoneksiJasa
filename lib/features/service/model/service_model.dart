class ServiceModel {
  final String id;
  final String name;
  final String address;
  final String image;
  final double range;
  final double rating;
  final int discount;
  final int price;
  final String linkMaps;
  final List<Facility> facilities;
  final List<String> photos;
  final List<Review> reviews;

  ServiceModel({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    required this.range,
    required this.rating,
    required this.discount,
    required this.price,
    required this.linkMaps,
    required this.facilities,
    required this.photos,
    required this.reviews,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json, String docId) {
    return ServiceModel(
      id: docId,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      range: (json['range'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      discount: json['discount'] ?? 0,
      price: json['price'] ?? 0,
      linkMaps: json['link_maps'] ?? '',
      facilities: (json['facilities'] as Map<String, dynamic>?)?.entries.map((entry) => Facility.fromJson(entry.key, entry.value)).toList() ?? [],
      photos: List<String>.from(json['photos'] ?? []),
      reviews: (json['reviews'] ?? []).map<Review>((item) => Review.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'image': image,
      'range': range,
      'rating': rating,
      'discount': discount,
      'price': price,
      'link_maps': linkMaps,
      'facilities': { for (var facility in facilities) facility.name : facility.toJson() },
      'photos': photos,
      'reviews': reviews.map((item) => item.toJson()).toList(),
    };
  }
}

class Facility {
  final String name;
  final dynamic detail;

  Facility({
    required this.name,
    required this.detail,
  });

  factory Facility.fromJson(String name, dynamic detail) {
    return Facility(
      name: name,
      detail: detail,
    );
  }

  Map<String, dynamic> toJson() {
    return detail;
  }
}

class Review {
  final String uid;
  final String userName;
  final String userPhoto;
  final String message;
  final double rating;

  Review({
    required this.uid,
    required this.userName,
    required this.userPhoto,
    required this.message,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      uid: json['uid'] ?? '',
      userName: json['user_name'] ?? '',
      userPhoto: json['user_photo'] ?? '',
      message: json['message'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'user_name': userName,
      'user_photo': userPhoto,
      'message': message,
      'rating': rating,
    };
  }
}
