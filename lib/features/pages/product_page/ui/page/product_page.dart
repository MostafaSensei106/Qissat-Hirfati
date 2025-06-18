import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_feature_will_be_available_later_dilog/cupertino_feature_will_be_available_later_dilog.dart';
import 'package:qissat_hirfati/features/pages/our_history/logic/take_image/take_image.dart';
import 'package:qissat_hirfati/features/pages/product_page/data/model/product_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> products = [
    ProductModel(
      productName: 'سيف سعودي أحدب',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '+966123456789',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$500',
      productRating: 4.5,
      productReviweCount: 120,
    ),
    ProductModel(
      productName: 'سيف سعودي مستقيم',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '+966987654321',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$550',
      productRating: 4.7,
      productReviweCount: 85,
    ),
    ProductModel(
      productName: 'سيف سعودي منقوش',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '+966123123123',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$600',
      productRating: 4.8,
      productReviweCount: 95,
    ),
    ProductModel(
      productName: 'سيف سعودي ذهبي',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '+966321321321',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$700',
      productRating: 4.9,
      productReviweCount: 150,
    ),
    ProductModel(
      productName: 'سيف سعودي فضي',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '+966456456456',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$650',
      productRating: 4.6,
      productReviweCount: 110,
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<ProductModel> filteredPlaces = products.where((product) {
      return product.productName.contains(searchQuery);
    }).toList();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: SizedBox(
          height: 36,
          child: CupertinoSearchTextField(
            placeholder: 'بحث',
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        padding: const EdgeInsetsDirectional.only(end: 8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const AppDivider(),
            itemBuilder: (context, index) {
              final place = filteredPlaces[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ProductCard(
                  product: place,
                  onPressed: () =>
                      CupertinoFeatureWillBeAvailableLaterDilog.show(context),
                ),
              );
            },
            itemCount: filteredPlaces.length,
          ),
        ),
      ),
    );
  }

  Future<dynamic> runCam(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              runImageGet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                const Icon(
                  CupertinoIcons.cube_box,
                  size: AppConstants.iconSize,
                ),
                const Text('صور منتجات'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              runImageGet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.map, size: AppConstants.iconSize),
                const SizedBox(width: 8),
                const Text('صور تراث'),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.of(context).pop();
          },
          child: const Text('اغلاق'),
        ),
      ),
    );
  }

  Future<dynamic> runImageGet(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              TakeImageBy.pickFromCamera();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                const Icon(CupertinoIcons.camera, size: AppConstants.iconSize),
                const Text('صورة من الكاميرا'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              TakeImageBy.pickFromGallery();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.photo, size: AppConstants.iconSize),
                const SizedBox(width: 8),
                const Text('الصور من المعرض'),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.of(context).pop();
          },
          child: const Text('اغلاق'),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.inBorderRadius),
            child: Image.asset(
              product.imagePaths.first,
              width: 170,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text('اسم الاسرة المنتجة: ${product.productionFamilyName}'),
                CupertinoButtonComponent(
                  onPressed: () {
                    UrlRunServices.launchURL(
                      product.productionFamilyWebsiteUrl,
                    );
                  },
                  text: 'موقعهم الالكتروني',
                ),
                Text('سعر المنتج: ${product.productPrice}'),
                Row(
                  children: [
                    Text('تقييم المنتج:'),
                    RatingBar(
                      ratingWidget: RatingWidget(
                        full: Icon(
                          CupertinoIcons.star_fill,
                          color: CupertinoColors.activeOrange,
                        ),
                        half: Icon(
                          CupertinoIcons.star_lefthalf_fill,
                          color: CupertinoColors.activeOrange,
                        ),
                        empty: Icon(
                          CupertinoIcons.star,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      onRatingUpdate: (_) {},
                      initialRating: product.productRating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      tapOnlyMode: false,
                      ignoreGestures: true,
                      itemSize: 20,
                    ),
                    Text('(${product.productReviweCount})'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
