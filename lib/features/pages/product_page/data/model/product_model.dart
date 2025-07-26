class ProductModel {
  ProductModel({
    required this.productName,
    required this.imagePaths,
    required this.productionFamilyName,
    required this.productWhatsappNumber,
    required this.productionFamilyWebsiteUrl,
    required this.productPrice,
    required this.productRating,
    required this.productReviweCount,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productName: map['productName'],
      imagePaths: List<String>.from(map['imagePaths']),
      productionFamilyName: map['productionFamilyName'],
      productWhatsappNumber: map['productWhatsappNumber'],
      productionFamilyWebsiteUrl: map['productionFamilyWebsiteUrl'],
      productPrice: map['productPrice'],
      productRating: map['productRating'],
      productReviweCount: map['productReviweCount'],
    );
  }
  final String productName;
  final List<String> imagePaths;
  final String productionFamilyName;
  final String productWhatsappNumber;
  final String productionFamilyWebsiteUrl;
  final String productPrice;
  final double productRating;
  final int productReviweCount;

  /// Converts this object into a [Map] that can be used
  /// to encode it to JSON.
  ///
  /// The map contains the following keys:
  ///
  /// * `productName`: [productName]
  /// * `imagePaths`: [imagePaths]
  /// * `productionFamilyName`: [productionFamilyName]
  /// * `productWhatsappNumber`: [productWhatsappNumber]
  /// * `productionFamilyWebsiteUrl`: [productionFamilyWebsiteUrl]
  /// * `productPrice`: [productPrice]
  /// * `productRating`: [productRating]
  /// * `productReviweCount`: [productReviweCount]
  ///
  /// The values of the map are the corresponding values of the object.
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'imagePaths': imagePaths,
      'productionFamilyName': productionFamilyName,
      'productWhatsappNumber': productWhatsappNumber,
      'productionFamilyWebsiteUrl': productionFamilyWebsiteUrl,
      'productPrice': productPrice,
      'productRating': productRating,
      'productReviweCount': productReviweCount,
    };
  }
}
