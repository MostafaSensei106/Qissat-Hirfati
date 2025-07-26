// Flutter core imports
import 'dart:io' show File;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Project-specific imports
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/our_history/logic/take_image/take_image.dart';
import 'package:qissat_hirfati/features/pages/place_page/ui/page/place_page.dart';
import 'package:qissat_hirfati/features/pages/product_page/ui/page/product_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart'
    show AppLocalizations;

// Main Stateful Widget for OurHistory Page
class OurHistory extends StatefulWidget {
  const OurHistory({super.key});

  @override
  State<OurHistory> createState() => _OurHistoryState();
}

class _OurHistoryState extends State<OurHistory> {
  List<PlaceModel> places = [
    PlaceModel(
      imagePaths: [
        {'path': 'assets/images/Tarout_Castle_1.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Tarout_Castle_2.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Tarout_Castle_3.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Tarout_Castle_4.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Tarout_Castle_5.webp', 'time': 'Week ago'},
      ],
      mapImagePath: 'assets/images/maps/Tarout_Castle_map.webp',
      mapLink:
          'https://www.google.com/maps/place/Tarout+Castle,+District,+Rahma+Street,+Alzomorod,+Tarout+32615/data=!4m2!3m1!1s0x3e4a01f0b22b0421:0x821937e5e57841e9?utm_source=mstt_1&entry=gps&coh=192189&g_ep=CAESBjI1LjIuNBgAINeCAyp1LDk0MjQyNTUzLDk0MjIzMjk5LDk0MjE2NDEzLDk0MjEyNDk2LDk0MjA3Mzk0LDk0MjA3NTA2LDk0MjA4NTA2LDk0MjE3NTIzLDk0MjE4NjUzLDk0MjI5ODM5LDQ3MDg0MzkzLDk0MjEzMjAwLDk0MjEzMzExQgJTQQ%3D%3D',
      name: 'قلعة تاروت',
      openInfoTime: '6:00 مساءً',
      description:
          'من أقدم المعالم التاريخية في جزيرة تاروت بمحافظة القطيف، يعود تاريخها إلى أكثر من 5,000 عام. شُيدت على أنقاض مستوطنة تعود لحضارة دلمون، وتتميز بتصميمها الدفاعي وموقعها الاستراتيجي المرتفع الذي جعلها مركزًا لحماية الجزيرة عبر العصور. اليوم، تُعد القلعة رمزًا ثقافيًا وتراثيًا يعكس عمق التاريخ السعودي وجماله.',
      subTitleDescription:
          'قلعة تاروت، معلم تاريخي بجزيرة تاروت في القطيف، المنطقة الشرقية بالسعودية. شُيدت على تل جنوب غرب البلدة القديمة، في موقع أثري يعود لـ4300 ق.م. تبعد 30 كم عن الدمام، وترتبط باليابسة عبر جسور.',
      location: 'المنطقة، شارع الرحمة، الزمرد، تاروت 32615',
      rating: 4.0,
      reviewCount: 6651,
    ),
    PlaceModel(
      imagePaths: [
        {'path': 'assets/images/Al-Hasa_1.avif', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Hasa_2.avif', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Hasa_3.avif', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Hasa_4.avif', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Hasa_5.avif', 'time': 'Week ago'},
      ],
      mapImagePath: 'assets/images/maps/Al-Hasa_map.webp',
      mapLink:
          'https://www.google.com/maps/place/Tarout+Castle,+District,+Rahma+Street,+Alzomorod,+Tarout+32615/data=!4m2!3m1!1s0x3e4a01f0b22b0421:0x821937e5e57841e9?utm_source=mstt_1&entry=gps&coh=192189&g_ep=CAESBjI1LjIuNBgAINeCAyp1LDk0MjQyNTUzLDk0MjIzMjk5LDk0MjE2NDEzLDk0MjEyNDk2LDk0MjA3Mzk0LDk0MjA3NTA2LDk0MjA4NTA2LDk0MjE3NTIzLDk0MjE4NjUzLDk0MjI5ODM5LDQ3MDg0MzkzLDk0MjEzMjAwLDk0MjEzMzExQgJTQQ%3D%3D',
      name: 'واحة الاحساء',
      openInfoTime: '6:00 مساءً',
      subTitleDescription:
          'واحة الأحساء، أُدرجت في قائمة التراث العالمي لليونسكو عام 2018، وتعد من أكبر الواحات الطبيعية في العالم، تشتهر بتمورها وعيونها التاريخية ومواقعها الأثرية العريقة.',
      location: 'طريق مكة المكرمة القديم، البلد، جدة 22236',
      description:
          'واحة الأحساء، الواقعة في المنطقة الشرقية من السعودية، تُعد من أكبر الواحات الطبيعية في العالم وأُدرجت ضمن قائمة التراث العالمي لليونسكو عام 2018. تتميز بأراضيها الخصبة وملايين أشجار النخيل، إلى جانب معالم تاريخية بارزة مثل قصر إبراهيم وسوق القيصرية، مما يجعلها رمزًا للتاريخ والبيئة والتنوع الثقافي.',
      rating: 4.0,
      reviewCount: 6651,
    ),
    PlaceModel(
      imagePaths: [
        {'path': 'assets/images/Makkah_Gate_1.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Makkah_Gate_2.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Makkah_Gate_3.webp', 'time': 'Week ago'},
      ],
      mapImagePath: 'assets/images/maps/Makkah_Gate_map.webp',
      mapLink:
          'https://www.google.com/maps/place/Makkah+Gate,+Old+Mecca+Al+Moukarramah+Rd,+Al-Balad,+Jeddah+22236/data=!4m2!3m1!1s0x15c3cf1ce87929d1:0xe1b7553a16f6026a?sa=X&ved=1t:242&ictx=111',
      name: 'باب مكة',
      openInfoTime: '10:30 مساءً',
      subTitleDescription:
          'باب مكة، أحد أشهر معالم مدينة جدة التاريخية، يعود تاريخه إلى القرن الـ14 الميلادي. كان يُستخدم كبوابة رئيسية لدخول وخروج الحجاج والبضائع من وإلى المدينة. يتميز بتصميمه المعماري العريق ويُعد رمزًا للتراث الثقافي والحضاري لجدة القديمة.',
      location: 'طريق مكة المكرمة القديم، البلد، جدة 22236',
      description:
          'باب مكة أحد أبواب سور جدة الثمانية، يقع باب مكة في منطقة جدة التاريخية وسط مدينة جدة غرب المملكة العربية السعودية، يعد باب مكة بوابة جدة الشرقية، ويقع أمام سوق البدو وينفذ إلى أسواق الحراج والحلقات الواقعة خارج السور، كما كان الباب أيضا معبرا للجنائز المتجهة إلى مقبرة شيخ الأسد الواقعة في تلك الناحية خارج السور.',
      rating: 4.4,
      reviewCount: 3995,
    ),
    PlaceModel(
      imagePaths: [
        {'path': 'assets/images/Al-Mashar_Castle_1.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Mashar_Castle_2.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Mashar_Castle_3.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Mashar_Castle_4.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Al-Mashar_Castle_5.webp', 'time': 'Week ago'},
      ],
      mapImagePath: 'assets/images/maps/Al-Mashar_Castle.webp',
      mapLink:
          'https://www.google.com/maps/place/HVJF%2BQ3M+%D9%82%D9%84%D8%B9%D8%A9+%D8%A7%D9%84%D9%85%D8%B3%D9%87%D8%B1,+Al+Gharith+29557%E2%80%AD/data=!4m2!3m1!1s0x15ecfefb831bc889:0xf8db65f91a52f053?utm_source=mstt_1&entry=gps&coh=192189&g_ep=CAESBjI1LjIuNBgAINeCAyp1LDk0MjQyNTUzLDk0MjIzMjk5LDk0MjE2NDEzLDk0MjEyNDk2LDk0MjA3Mzk0LDk0MjA3NTA2LDk0MjA4NTA2LDk0MjE3NTIzLDk0MjE4NjUzLDk0MjI5ODM5LDQ3MDg0MzkzLDk0MjEzMjAwLDk0MjEzMzExQgJTQQ%3D%3D',
      name: 'قلعة المسهر',
      openInfoTime: '5:00 مساءً',
      subTitleDescription:
          'قلعة المسهر في عسير، حصن تاريخي يعود لقرون، بُنيت من الحجر والخشب لحماية القوافل ومراقبة الطرق، وتعكس جمال التراث العمراني.',
      location: 'الغريف, السعودية 29557',
      description:
          'معلم تاريخي في منطقة عسير جنوب السعودية، بُنيت منذ مئات السنين كموقع دفاعي ومراقبة. تتميز بتصميمها التقليدي من الحجر والطين وموقعها المرتفع الذي يوفر إطلالات واسعة. تُعد القلعة اليوم رمزًا للتراث العسيري ووجهة سياحية بارزة.',
      rating: 4.0,
      reviewCount: 6651,
    ),
    PlaceModel(
      imagePaths: [
        {'path': 'assets/images/Hegra_1.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Hegra_2.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Hegra_3.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Hegra_4.webp', 'time': 'Week ago'},
        {'path': 'assets/images/Hegra_5.webp', 'time': 'Week ago'},
      ],
      mapImagePath: 'assets/images/maps/Hegra_map.webp',
      mapLink:
          'https://www.google.com/maps/place/HVJF%2BQ3M+%D9%82%D9%84%D8%B9%D8%A9+%D8%A7%D9%84%D9%85%D8%B3%D9%87%D8%B1,+Al+Gharith+29557%E2%80%AD/data=!4m2!3m1!1s0x15ecfefb831bc889:0xf8db65f91a52f053?utm_source=mstt_1&entry=gps&coh=192189&g_ep=CAESBjI1LjIuNBgAINeCAyp1LDk0MjQyNTUzLDk0MjIzMjk5LDk0MjE2NDEzLDk0MjEyNDk2LDk0MjA3Mzk0LDk0MjA3NTA2LDk0MjA4NTA2LDk0MjE3NTIzLDk0MjE4NjUzLDk0MjI5ODM5LDQ3MDg0MzkzLDk0MjEzMjAwLDk0MjEzMzExQgJTQQ%3D%3D',
      name: 'مدائن صالح',
      openInfoTime: '10:00 ص',
      subTitleDescription:
          'مدائن صالح، أحد أشهر Sites التراثية في السعودية، يقع في منطقة المدينة المنورة. يعود تاريخه إلى القرن الأول الميلادي، ويضم مجموعة من النقوش والمنحوتات النبطية.',
      location: 'الحجر، السعودية',
      description:
          'مدائن صالح، أحد أهم المواقع التراثية في السعودية، يعود تاريخه إلى القرن الأول الميلادي، ويضم مجموعة من النقوش والمنحوتات النبطية. يعد الموقع أحد أهم مواقع التراث العالمي لليونسكو ويُعد رمزًا للثقافة والتراث النبطي.',
      rating: 4.6,
      reviewCount: 10131,
    ),
  ];

  String searchQuery = '';

  @override
  /// Builds the OurHistory page with a search bar and filtered places list
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!; // Localized text instance

    // Filter places based on search input
    final filteredPlaces = places.where((place) {
      return place.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          place.description.toLowerCase().contains(searchQuery.toLowerCase()) ||
          place.subTitleDescription.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          place.location.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: SizedBox(
          height: 36,
          child: CupertinoSearchTextField(
            placeholder: tr.search,
            onChanged: (value) => setState(() => searchQuery = value),
          ),
        ),
        trailing: CupertinoButtonComponent(
          child: const Icon(CupertinoIcons.camera, size: AppConstants.iconSize),
          onPressed: () => runCam(context),
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
            separatorBuilder: (_, _) => const AppDivider(),
            itemCount: filteredPlaces.length,
            itemBuilder: (context, index) {
              final place = filteredPlaces[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: PlaceCard(
                  place: place,
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => PlacePage(place: place)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Displays camera option sheet for taking/selecting images
  Future<dynamic> runCam(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.pop(context);
              runImageProducts(context);
            },
            child: _buildActionRow(CupertinoIcons.cube_box, tr.productPhotos),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.pop(context);
              runImageTurath(context);
            },
            child: _buildActionRow(CupertinoIcons.map, tr.heritagePhotos),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text(tr.close),
        ),
      ),
    );
  }

  /// Picks product image and navigates to ProductPage
  Future<dynamic> runImageProducts(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.pop(context);
              TakeImageBy.pickFromCamera();
              Future.delayed(const Duration(seconds: 2)).then(
                (_) => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => const ProductPage()),
                ),
              );
            },
            child: _buildActionRow(CupertinoIcons.camera, tr.imageFromCamera),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.pop(context);
              TakeImageBy.pickFromGallery();
              Future.delayed(const Duration(seconds: 2)).then(
                (_) => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => const ProductPage()),
                ),
              );
            },
            child: _buildActionRow(CupertinoIcons.photo, tr.imageFromGallery),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text(tr.close),
        ),
      ),
    );
  }

  Future<bool> _recognizeImage(File imageFile) async {
    try {
      final fileName = imageFile.path.split('/').last;
      final nameWithoutExtension = fileName.split('.').first;

      return nameWithoutExtension == '3977';
    } catch (e) {
      print('خطأ في التعرف على الصورة: $e');
      return false;
    }
  }

  /// Picks heritage image and navigates to appropriate PlacePage
  Future<dynamic> runImageTurath(BuildContext context) async {
    final tr = AppLocalizations.of(context)!;
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.pop(context);
              TakeImageBy.pickFromCamera();
              Future.delayed(const Duration(seconds: 1));
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => PlacePage(place: places.first),
                ),
              );
            },
            child: _buildActionRow(CupertinoIcons.camera, tr.imageFromCamera),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              HapticFeedback.vibrate();

              try {
                final imageFile = await TakeImageBy.pickFromGallery();
                print('🔍 نتيجة الاختيار: $imageFile');

                if (imageFile != null) {
                  final fileName = imageFile.path.split('/').last;
                  print('اسم الصورة المختارة: $fileName');

                  final isRecognized = await _recognizeImage(imageFile);

                  if (isRecognized) {
                    Navigator.pop(context);
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => PlacePage(place: places.first),
                        ),
                      );
                    }
                  } else {
                    if (context.mounted) {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return CupertinoAlertDialog(
                            title: const Text('لم يتم التعرف على الصورة'),
                            content: const Text(
                              'الصورة المختارة لا تحتوي على المعرف المطلوب. يرجى اختيار الصورة الصحيحة.',
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('إعادة المحاولة'),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  runImageTurath(context);
                                },
                              ),
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text('موافق'),
                                onPressed: () => Navigator.of(ctx).pop(),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                } else {
                  if (context.mounted) {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return CupertinoAlertDialog(
                          title: const Text('لم يتم اختيار صورة'),
                          content: const Text('يرجى اختيار صورة للمتابعة.'),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text('موافق'),
                              onPressed: () => Navigator.of(ctx).pop(),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              } catch (e) {
                print('خطأ في اختيار الصورة: $e');
                if (context.mounted) {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return CupertinoAlertDialog(
                        title: const Text('خطأ'),
                        content: const Text(
                          'حدث خطأ أثناء اختيار الصورة. يرجى المحاولة مرة أخرى.',
                        ),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text('موافق'),
                            onPressed: () => Navigator.of(ctx).pop(),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },

            child: _buildActionRow(CupertinoIcons.photo, tr.imageFromGallery),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.pop(context);
            Future.delayed(const Duration(seconds: 20));
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => const ProductPage()),
            );
          },
          child: Text(tr.close),
        ),
      ),
    );
  }

  /// Builds a row with icon and text for CupertinoActionSheetAction
  Widget _buildActionRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: AppConstants.iconSize),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

// A reusable widget to display each place card in the list
class PlaceCard extends StatelessWidget {
  const PlaceCard({required this.place, required this.onPressed, super.key});

  final PlaceModel place;
  final VoidCallback onPressed;

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
              place.imagePaths.first['path']!.trim(),
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
                  place.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  place.subTitleDescription,
                  style: const TextStyle(color: CupertinoColors.systemGrey),
                  maxLines: 4,
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
