import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' as painting;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_background_remover/image_background_remover.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/our_history/logic/take_image/take_image.dart';
import 'package:qissat_hirfati/features/pages/product_page/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/product_page/ui/page/product_page.dart';
import 'package:qissat_hirfati/features/pages/product_page/ui/widget/product_details_page.dart';
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
            const AppDivider(),
            Text(
              tr.relatedProducts, // Translated "Related products"
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RelatedProductsWidget(),
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

class RelatedProductsWidget extends StatelessWidget {
  const RelatedProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductModel(
        name: 'سيف سعودي أحدب',
        imagePaths: ['assets/images/sword1.png'],
        productionFamilyName: 'عائلة السيوفي',
        productWhatsappNumber: '201014414536',
        productionFamilyWebsiteUrl: 'https://swordsfamily.com',
        productPrice: '500',
        productRating: 4.0,
        productReviweCount: 120,
      ),
      ProductModel(
        name: 'سيف سعودي مستقيم',
        imagePaths: ['assets/images/sword1.png'],
        productionFamilyName: 'عائلة السيوفي',
        productWhatsappNumber: '201014414536',
        productionFamilyWebsiteUrl: 'https://swordsfamily.com',
        productPrice: '550',
        productRating: 3,
        productReviweCount: 85,
      ),
      ProductModel(
        name: 'سيف سعودي منقوش',
        imagePaths: ['assets/images/sword1.png'],
        productionFamilyName: 'عائلة السيوفي',
        productWhatsappNumber: '201014414536',
        productionFamilyWebsiteUrl: 'https://swordsfamily.com',
        productPrice: '600',
        productRating: 5,
        productReviweCount: 95,
      ),
      ProductModel(
        name: 'سيف سعودي ذهبي',
        imagePaths: ['assets/images/sword1.png'],
        productionFamilyName: 'عائلة السيوفي',
        productWhatsappNumber: '201014414536',
        productionFamilyWebsiteUrl: 'https://swordsfamily.com',
        productPrice: '700',
        productRating: 4.9,
        productReviweCount: 150,
      ),
      ProductModel(
        name: 'سيف سعودي فضي',
        imagePaths: ['assets/images/sword1.png'],
        productionFamilyName: 'عائلة السيوفي',
        productWhatsappNumber: '201014414536',
        productionFamilyWebsiteUrl: 'https://swordsfamily.com',
        productPrice: '650',
        productRating: 4.6,
        productReviweCount: 110,
      ),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          Expanded(
            child: ProductCard(
              product: products[0],
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(product: products[0]),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ProductCard(
              product: products[1],
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(product: products[1]),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ProductCard(
              product: products[2],
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(product: products[2]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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

  File? _removedBgImageFile;
  Offset _offset = Offset.zero;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _offset = Offset.zero;
    _scale = 1.0;
    BackgroundRemover.instance.initializeOrt();
  }

  @override
  void dispose() {
    _pageController.dispose();
    BackgroundRemover.instance.dispose();
    super.dispose();
  }

  Future<void> _pickOverlayImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      final imageBytes = await image.readAsBytes();
      final removedBgImage = await BackgroundRemover.instance.removeBg(
        imageBytes,
      );

      final directory = await getTemporaryDirectory();
      final tempPath = directory.path;
      final tempFile = File('$tempPath/removed_bg_image.png');
      await tempFile.writeAsBytes(
        (await removedBgImage.toByteData(
          format: ui.ImageByteFormat.png,
        ))!.buffer.asUint8List(),
      );

      setState(() {
        _removedBgImageFile = tempFile;
        _offset = Offset.zero;
        _scale = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _pickOverlayImage,
              child: const Icon(
                CupertinoIcons.photo,
                color: CupertinoColors.white,
              ),
            ),
            // if (_removedBgImageFile != null)
            //   CupertinoButton(
            //     padding: EdgeInsets.zero,
            //     onPressed: () => _saveCombinedImage(context),
            //     child: const Icon(CupertinoIcons.down_arrow, color: CupertinoColors.white),
            //   ),
          ],
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
            minScale: 1,
            maxScale: 3.0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                    tag: 'place_image_$index',
                    child: Image.asset(
                      widget.imagePaths[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                  if (_removedBgImageFile != null)
                    Positioned.fill(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return GestureDetector(
                            onPanUpdate: (details) {
                              setState(() {
                                _offset += details.delta;
                              });
                            },
                            onScaleUpdate: (details) {
                              setState(() {
                                _scale = details.scale;
                              });
                            },
                            child: Transform.translate(
                              offset: _offset,
                              child: Transform.scale(
                                scale: _scale,
                                child: Image.file(
                                  _removedBgImageFile!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveCombinedImage(BuildContext context) async {
    final baseImage = await _loadImage(widget.imagePaths[currentIndex]);
    final overlayImage = await _loadImageFile(_removedBgImageFile!);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Draw base image
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(
        0,
        0,
        baseImage.width.toDouble(),
        baseImage.height.toDouble(),
      ),
      image: baseImage,
      fit: BoxFit.cover,
    );

    // Draw overlay image with current offset and scale
    final overlayWidth = overlayImage.width * _scale;
    final overlayHeight = overlayImage.height * _scale;

    final offsetX = _offset.dx + (baseImage.width - overlayWidth) / 2;
    final offsetY = _offset.dy + (baseImage.height - overlayHeight) / 2;

    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(offsetX, offsetY, overlayWidth, overlayHeight),
      image: overlayImage,
      fit: BoxFit.fill,
    );

    final img = await recorder.endRecording().toImage(
      baseImage.width,
      baseImage.height,
    );
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final path =
        '${directory.path}/combined_image_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(path);
    await file.writeAsBytes(pngBytes);

    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Image saved to $path')));
  }

  Future<ui.Image> _loadImage(String path) async {
    if (path.startsWith('assets/')) {
      final data = await rootBundle.load(path);
      final bytes = data.buffer.asUint8List();
      return await painting.decodeImageFromList(bytes);
    } else {
      final file = File(path);
      final bytes = await file.readAsBytes();
      return await painting.decodeImageFromList(bytes);
    }
  }

  Future<ui.Image> _loadImageFile(File file) async {
    final bytes = await file.readAsBytes();
    return await painting.decodeImageFromList(bytes);
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
