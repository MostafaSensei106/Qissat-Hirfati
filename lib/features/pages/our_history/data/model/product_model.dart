
class PlaceModel {
  final List<Map<String, String>> imagePaths;
  final String name;
  final String openInfoTime;
  final String description;
  final String subTitleDescription;
  final String location;
  final String mapLink;
  final String mapImagePath;
  final double rating;
  final double reviewCount;

  PlaceModel({
    required this.imagePaths,
    required this.name,
    required this.openInfoTime,
    required this.description,
    required this.subTitleDescription,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.mapLink,
    required this.mapImagePath
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePaths,
      'name': name,
      'openInfo': openInfoTime,
      'description': description,
      'subTitleDescription': subTitleDescription,
      'location': location,
      'rating': rating,
      'reviewCount': reviewCount,
      'mapLink': mapLink,
      'mapImagePath': mapImagePath
    };
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      imagePaths: json['imagePath'],
      name: json['name'],
      openInfoTime: json['openInfo'],
      description: json['description'],
      subTitleDescription: json['subTitleDescription'],
      location: json['location'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      mapLink: json['mapLink'],
      mapImagePath: json['mapImagePath'],
    );
  }
}
