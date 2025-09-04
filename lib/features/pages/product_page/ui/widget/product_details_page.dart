import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/features/pages/product_page/data/model/product_model.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart'
    show AppLocalizations;

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({required this.product, super.key});
  final ProductModel product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin {
  int currentImageIndex = 0;
  bool isFavorite = false;
  int quantity = 1;
  late AnimationController _animationController;
  late AnimationController _heartAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _heartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _heartAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _heartAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _heartAnimationController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    if (isFavorite) {
      _heartAnimationController.forward().then((_) {
        _heartAnimationController.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.withOpacity(0.9),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.arrow_right, size: 28),
        ),
        trailing: ScaleTransition(
          scale: _heartAnimation,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _toggleFavorite,
            child: Icon(
              isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: isFavorite
                  ? CupertinoColors.systemRed
                  : CupertinoColors.systemGrey,
              size: 26,
            ),
          ),
        ),
      ),

      child: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomScrollView(
          slivers: [
            // Product Images Carousel
            SliverToBoxAdapter(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  height: 350,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: widget.product.imagePaths.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentImageIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _showImageViewer(context, index),
                              child: Hero(
                                tag: 'product_image_$index',
                                child: Image.asset(
                                  widget.product.imagePaths[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        ),

                        // Image Indicators
                        if (widget.product.imagePaths.length > 1)
                          Positioned(
                            bottom: 16,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                widget.product.imagePaths.length,
                                (index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: currentImageIndex == index ? 12 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: currentImageIndex == index
                                        ? CupertinoColors.white
                                        : CupertinoColors.white.withAlpha(0x50),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // Zoom Icon
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: CupertinoColors.black.withAlpha(0x60),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              CupertinoIcons.zoom_in,
                              color: CupertinoColors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Product Info
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name and Rating
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildRatingWidget(),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Production Family
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        widget.product.productionFamilyName,
                        style: const TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Price
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CupertinoColors.activeGreen.withOpacity(0.1),
                            CupertinoColors.activeGreen.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CupertinoColors.activeGreen.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.money_dollar_circle,
                            color: CupertinoColors.activeGreen,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'السعر',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Text(
                                '${int.parse(widget.product.productPrice) * quantity} ريال سعودي',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.activeGreen,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Product Description
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6.resolveFrom(context),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'وصف المنتج',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'هذا المنتج التراثي الأصيل مصنوع بعناية فائقة من قبل ${widget.product.productionFamilyName} باستخدام تقنيات تراثية عريقة تم توارثها عبر الأجيال. يتميز بجودة عالية وتصميم فريد يعكس الهوية الثقافية الأصيلة.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: CupertinoColors.label.resolveFrom(context),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Quantity Selector
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CupertinoColors.systemGrey5.resolveFrom(
                            context,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'الكمية:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: quantity > 1
                                    ? () {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    : null,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: quantity > 1
                                        ? CupertinoColors.systemGrey5
                                              .resolveFrom(context)
                                        : CupertinoColors.systemGrey6
                                              .resolveFrom(context),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    color: quantity > 1
                                        ? CupertinoColors.label.resolveFrom(
                                            context,
                                          )
                                        : CupertinoColors.systemGrey3
                                              .resolveFrom(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.systemGrey5
                                        .resolveFrom(context),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    color: CupertinoColors.label.resolveFrom(
                                      context,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Contact Info
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CupertinoColors.systemIndigo.withOpacity(0.1),
                            CupertinoColors.systemBlue.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'معلومات التواصل',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // WhatsApp
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeGreen
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  CupertinoIcons.phone,
                                  color: CupertinoColors.activeGreen,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'تواصل عبر الواتساب',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                color: CupertinoColors.activeGreen,
                                borderRadius: BorderRadius.circular(20),
                                onPressed: () {
                                  UrlRunServices.launchURL(
                                    'https://wa.me/${widget.product.productWhatsappNumber}?text=مرحباً، أريد الاستفسار عن ${widget.product.name}',
                                  );
                                },
                                child: const Text(
                                  'تواصل',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Website
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeBlue.withOpacity(
                                    0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  CupertinoIcons.globe,
                                  color: CupertinoColors.activeBlue,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'زيارة الموقع الإلكتروني',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                color: CupertinoColors.activeBlue,
                                borderRadius: BorderRadius.circular(20),
                                onPressed: () {
                                  UrlRunServices.launchURL(
                                    widget.product.productionFamilyWebsiteUrl,
                                  );
                                },
                                child: const Text(
                                  'زيارة',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100), // Space for bottom buttons
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.product.productRating.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          RatingBar(
            ratingWidget: RatingWidget(
              full: const Icon(
                CupertinoIcons.star_fill,
                color: CupertinoColors.systemYellow,
              ),
              half: const Icon(
                CupertinoIcons.star_lefthalf_fill,
                color: CupertinoColors.systemYellow,
              ),
              empty: const Icon(
                CupertinoIcons.star,
                color: CupertinoColors.systemGrey3,
              ),
            ),
            onRatingUpdate: (_) {},
            initialRating: widget.product.productRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            tapOnlyMode: false,
            ignoreGestures: true,
            itemSize: 16,
          ),
          const SizedBox(width: 4),
          Text(
            '(${widget.product.productReviweCount})',
            style: const TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
    );
  }

  void _showImageViewer(BuildContext context, int initialIndex) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ImageViewPage(
          imagePaths: widget.product.imagePaths,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  // ignore: unused_element
  void _showAddToCartDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('تمت الإضافة للسلة'),
          content: Text(
            'تم إضافة ${widget.product.name} للسلة بكمية $quantity',
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('متابعة التسوق'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('عرض السلة'),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to cart page
              },
            ),
          ],
        );
      },
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
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: Text(
          '${currentIndex + 1} من ${widget.imagePaths.length}',
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
                tag: 'product_image_$index',
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
