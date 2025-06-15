import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';

class PlacePage extends StatelessWidget {
  final PlaceModel place;

  const PlacePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
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
            Row(
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
                    empty: Icon(
                      CupertinoIcons.star,
                      color: CupertinoColors.systemGrey,
                    ),
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
            ),
            Row(
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
            ),
            Text(place.location),
            Hero(
              tag: place.imagePath,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppConstants.inBorderRadius,
                ),
                child: Image.asset(
                  place.imagePath,
                  width: double.maxFinite,
                  height: 300,
                  fit: BoxFit.cover,
                ),
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
}
