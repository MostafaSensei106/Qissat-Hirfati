import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';

class PlacePage extends StatelessWidget {
  final PlaceModel place;

  const PlacePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    // final tr = AppLocalizations.of(context)!;
    final PageController controller = PageController();
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
            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: controller,
                itemCount: place.imagePaths.length,
                itemBuilder: (context, index) {
                  final imagePath = place.imagePaths[index];

                  return CupertinoButtonComponent(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoSheetRoute(
                          builder: (_) => FullImageScreen(imagePath: imagePath),
                        ),
                      );
                    },
                    child: Hero(
                      tag: imagePath,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        ),
                      ),
                    ),
                  );
                },
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

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  const FullImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('عرض الصورة')),
      child: Center(
        child: Hero(
          tag: imagePath,
          child: InteractiveViewer(
            constrained: false,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
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
