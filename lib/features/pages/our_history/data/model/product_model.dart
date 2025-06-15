
class PlaceModel {
  final String imagePath;
  final String name;
  final String openInfoTime;
  final String description;
  final String subTitleDescription;
  final String location;
  final double rating;
  final double reviewCount;

  PlaceModel({
    required this.imagePath,
    required this.name,
    required this.openInfoTime,
    required this.description,
    required this.subTitleDescription,
    required this.location,
    required this.rating,
    required this.reviewCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'openInfo': openInfoTime,
      'description': description,
      'subTitleDescription': subTitleDescription,
      'location': location,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      imagePath: json['imagePath'],
      name: json['name'],
      openInfoTime: json['openInfo'],
      description: json['description'],
      subTitleDescription: json['subTitleDescription'],
      location: json['location'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
    );
  }
}
