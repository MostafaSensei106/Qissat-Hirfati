import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/our_history/logic/take_image/take_image.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart'
    show AppLocalizations;

class PlacePage extends StatefulWidget {
  const PlacePage({required this.place, super.key});
  final PlaceModel place;

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.place.name,
        ), // Name is already in English from PlaceModel
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
            Text(
              widget.place.location,
            ), // Location is already in English from PlaceModel
            SizedBox(
              height: 250,
              child: CarouselView.weighted(
                // Assuming CarouselView is a custom widget
                flexWeights: const [1, 7],
                itemSnapping: true,
                scrollDirection: Axis.horizontal,
                controller: CarouselController(
                  initialItem: 0,
                ), // Assuming CarouselController
                onTap: (index) => _showImageViewer(context, index),
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
                        child: Hero(
                          tag:
                              'place_image_${widget.place.imagePaths.indexOf(path)}',
                          child: Image.asset(
                            path['path'] ?? '',
                            fit: BoxFit.cover,
                          ),
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
                                tr.noDateAvailable, // Translated "No date available"
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
              '${tr.aboutHeritage} - ${widget.place.name}', // Translated "About the heritage"
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.place.description,
            ), // Description is already in English from PlaceModel
            const SizedBox(height: 8),
            const AppDivider(),
            Text(
              tr.map,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ), // Translated "Map"
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

  void _showImageViewer(BuildContext context, int initialIndex) {
    // Extract image paths from the place data
    final imagePaths = widget.place.imagePaths
        .map((pathData) => pathData['path'] ?? '')
        .where((path) => path.isNotEmpty)
        .toList();

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) =>
            ImageViewPage(imagePaths: imagePaths, initialIndex: initialIndex),
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
            empty: const Icon(
              CupertinoIcons.star,
              color: CupertinoColors.systemGrey,
            ),
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

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({
    required this.imagePaths,
    this.initialIndex = 0,
    super.key,
  });

  final List<String> imagePaths;
  final int initialIndex;

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: Text(
          '${currentIndex + 1} /  ${widget.imagePaths.length}',
          style: const TextStyle(color: CupertinoColors.white),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.xmark, color: CupertinoColors.white),
        ),
      ),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 3.0,
            child: Center(
              child: Hero(
                tag: 'place_image_$index',
                child: Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CloseOpenWidget extends StatelessWidget {
  const CloseOpenWidget({required this.place, super.key});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!; // Get AppLocalizations instance
    return Row(
      spacing: 8,
      children: [
        Text(
          tr.open, // Translated "Open"
          style: const TextStyle(
            color: CupertinoColors.activeGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('-'),
        Text(
          tr.closes, // Translated "Closes"
          style: const TextStyle(
            color: CupertinoColors.destructiveRed,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(place.openInfoTime), // Time is already in English from PlaceModel
      ],
    );
  }
}
