import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_feature_will_be_available_later_dilog/cupertino_feature_will_be_available_later_dilog.dart';
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
      productWhatsappNumber: '201014414536',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$500',
      productRating: 4.0,
      productReviweCount: 120,
    ),
    ProductModel(
      productName: 'سيف سعودي مستقيم',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '201014414536',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$550',
      productRating: 3,
      productReviweCount: 85,
    ),
    ProductModel(
      productName: 'سيف سعودي منقوش',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '201014414536',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$600',
      productRating: 5,
      productReviweCount: 95,
    ),
    ProductModel(
      productName: 'سيف سعودي ذهبي',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '201014414536',
      productionFamilyWebsiteUrl: 'https://swordsfamily.com',
      productPrice: '\$700',
      productRating: 4.9,
      productReviweCount: 150,
    ),
    ProductModel(
      productName: 'سيف سعودي فضي',
      imagePaths: ['assets/images/sword1.png'],
      productionFamilyName: 'عائلة السيوفي',
      productWhatsappNumber: '201014414536',
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
                  // onPressed: () =>
                  //     CupertinoFeatureWillBeAvailableLaterDilog.show(context),
                ),
              );
            },
            itemCount: filteredPlaces.length,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  //final VoidCallback onPressed;

  const ProductCard({
    super.key,
    required this.product,
    ///required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.inBorderRadius),
          child: Image.asset(
            product.imagePaths.first,
            width: 120,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  CupertinoButtonComponent(
                    icon: const Icon(CupertinoIcons.phone),
                    onPressed: () {
                      UrlRunServices.launchURL(
                        'https://wa.me/${product.productWhatsappNumber}',
                      );
                    },
                  ),
                ],
              ),
              Text('الاسرة المنتجة: ${product.productionFamilyName}'),
              Row(
              
                children: [
                  Text('موقعهم الالكتروني: '),
                  CupertinoButtonComponent(
                    onPressed: () {
                      UrlRunServices.launchURL(
                        product.productionFamilyWebsiteUrl,
                      );
                    },
                    text: 'اضغط هنا',
                  ),
                ],
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
    );
  }
}
