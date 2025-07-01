import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/our_history/logic/take_image/take_image.dart';

class PlacePage extends StatefulWidget {

  const PlacePage({required this.place, super.key});
  final PlaceModel place;

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    // final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.place.name),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        trailing: CupertinoButtonComponent(
          onPressed: () {
            TakeImageBy.pickFromCamera().then((file) {
              if (file != null) {
                setState(() {
                  widget.place.imagePaths.add({'path': file.path});
                });
              }
            });
          },
          child: const Icon(
            CupertinoIcons.add_circled,
            size: AppConstants.iconSize,
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            starsWidget(),
            CloseOpenWidget(place: widget.place),
            Text(widget.place.location),
            SizedBox(
              height: 250,
              child: CarouselView.weighted(
                flexWeights: const [1, 7],
                itemSnapping: true,
                scrollDirection: Axis.horizontal,
                controller: CarouselController(initialItem: 0),
                onTap: (index) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewPage(
                      imagePath: widget.place.imagePaths[index]['path'] ?? '',
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
                children: widget.place.imagePaths.map((path) {
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
                            color: CupertinoColors.darkBackgroundGray.withAlpha(
                              0x80,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppConstants.inBorderRadius,
                            ),
                          ),
                          child: Text(
                            widget.place.imagePaths.last['time'] ??
                                'لا يوجد تاريخ',
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
              'نبذة تعريفية عن التراث - ${widget.place.name}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.place.description),
            const SizedBox(height: 8),
            const AppDivider(),
            const Text('الخريطة', style: TextStyle(fontWeight: FontWeight.bold)),
            CupertinoButtonComponent(
              onPressed: () {
                UrlRunServices.launchURL(widget.place.mapLink);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppConstants.inBorderRadius,
                ),
                child: Image.asset(widget.place.mapImagePath, fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Row starsWidget() {
    return Row(
      spacing: 8,
      children: [
        Text(widget.place.rating.toString()),
        RatingBar(
          ratingWidget: RatingWidget(
            full: const Icon(
              CupertinoIcons.star_fill,
              color: CupertinoColors.activeOrange,
            ),
            half: const Icon(
              CupertinoIcons.star_lefthalf_fill,
              color: CupertinoColors.activeOrange,
            ),
            empty: const Icon(CupertinoIcons.star, color: CupertinoColors.systemGrey),
          ),
          onRatingUpdate: (_) {},
          initialRating: widget.place.rating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          tapOnlyMode: false,
          ignoreGestures: true,
          itemSize: 20,
        ),
        Text('(${widget.place.reviewCount})'),
      ],
    );
  }
}

class ImageViewPage extends StatelessWidget {

  const ImageViewPage({required this.imagePath, super.key});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('عرض الصورة')),
      child: Center(child: Image.asset(imagePath, fit: BoxFit.fill)),
    );
  }
}

class CloseOpenWidget extends StatelessWidget {
  const CloseOpenWidget({required this.place, super.key});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        const Text(
          ' مفتوح',
          style: TextStyle(
            color: CupertinoColors.activeGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('-'),
        const Text(
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
