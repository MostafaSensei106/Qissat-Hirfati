import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';

class PlacePage extends StatelessWidget {
  final PlaceModel place;

  const PlacePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    // final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(place.name),
        backgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            starsWidget(),
            CloseOpenWidget(place: place),
            Text(place.location),
            SizedBox(
              height: 250,
              child: CarouselView.weighted(
                flexWeights: const [1,7],
                itemSnapping: true,
                scrollDirection: Axis.horizontal,
                controller: CarouselController(
                  initialItem: 1,
                ),
                onTap: (index) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewPage(
                      imagePath: place.imagePaths[index]['path'] ?? '',
                    ),
                  ),
                ),
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.inBorderRadius,
                    ),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.inBorderRadius,
                    ),
                  ),
                  0.5,
                ),
                children: place.imagePaths.map((path) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.asset(
                          path['path'] ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 7,
                        left: 7,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: CupertinoColors.darkBackgroundGray.withAlpha(0x80),
                            borderRadius: BorderRadius.circular(
                              AppConstants.inBorderRadius,
                            ),
                          ),
                          child: Text(
                            place.imagePaths.last['time'] ?? 'لا يوجد تاريخ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Text(
              'نبذة تعريفية عن التراث - ${place.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(place.description),
            SizedBox(height: 8),
            AppDivider(),
            SizedBox(height: 8),

            Text('الخريطة', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Row starsWidget() {
    return Row(
      spacing: 8,
      children: [
        Text(place.rating.toString()),
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
            empty: Icon(CupertinoIcons.star, color: CupertinoColors.systemGrey),
          ),
          onRatingUpdate: (_) {},
          initialRating: place.rating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          tapOnlyMode: false,
          ignoreGestures: true,
          itemSize: 20,
        ),
        Text('(${place.reviewCount})'),
      ],
    );
  }
}

class ImageViewPage extends StatelessWidget {
  final String imagePath;

  const ImageViewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('عرض الصورة')),
      child: Center(child: Image.asset(imagePath, fit: BoxFit.fill)),
    );
  }
}

class CloseOpenWidget extends StatelessWidget {
  const CloseOpenWidget({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(
          ' مفتوح',
          style: TextStyle(
            color: CupertinoColors.activeGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('-'),
        Text(
          'يغلق',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(place.openInfoTime),
      ],
    );
  }
}
