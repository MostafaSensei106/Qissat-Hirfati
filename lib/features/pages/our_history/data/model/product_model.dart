class PlaceModel {
  final String imagePath;
  final String name;
  final String openInfo;
  final String description;
  final String location;
  final String rating;
  final String reviewCount;

  PlaceModel({
    required this.imagePath,
    required this.name,
    required this.openInfo,
    required this.description,
    required this.location,
    required this.rating,
    required this.reviewCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'openInfo': openInfo,
      'description': description,
      'location': location,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      imagePath: json['imagePath'],
      name: json['name'],
      openInfo: json['openInfo'],
      description: json['description'],
      location: json['location'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
    );
  }
}
