class ServiceModel {
  final String id;
  final String name;
  final String address;
  final String image;
  final double range;
  final double rating;

  ServiceModel({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    required this.range,
    required this.rating,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json, String docId) {
    return ServiceModel(
      id: docId,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      range: (json['range'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'image': image,
      'range': range,
      'rating': rating,
    };
  }
}