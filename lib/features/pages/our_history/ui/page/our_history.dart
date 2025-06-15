import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_feature_will_be_available_later_dilog/cupertino_feature_will_be_available_later_dilog.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/place_page/ui/page/place_page.dart';

class OurHistory extends StatelessWidget {
  const OurHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: SizedBox(
          height: 36,
          child: CupertinoSearchTextField(placeholder: 'بحث'),
        ),
        trailing: CupertinoButtonComponent(
          child: const Icon(CupertinoIcons.camera, size: AppConstants.iconSize),
          onPressed: () {
            CupertinoFeatureWillBeAvailableLaterDilog.show(context);
          },
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        padding: const EdgeInsetsDirectional.only(end: 8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingHalf,
          ),
          child: Column(
            children: [
              PlaceCard(

                
                imagePath: AppConstants.handPNG,
                title: 'محمد بن سلمان السعودي',
                description:
                    'قصة حرفيون سعوديون يبدعون المستقبل بعبق التراث وعراقة الأصالة',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PlacePage(
                        place: PlaceModel(
                          imagePath: AppConstants.handPNG,
                          name: 'محمد بن سلمان السعودي',
                          openInfo: '',
                          description:
                              'قصة حرفيون سعوديون يبدعون المستقبل بعبق التراث وعراقة الأصالة',
                          location: '',
                          rating: '',
                          reviewCount: '',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;

  const PlaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
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
          Hero(
            tag: imagePath,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.outBorderRadius),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
