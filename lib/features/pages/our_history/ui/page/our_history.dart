import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/our_history/logic/take_image/take_image.dart';
import 'package:qissat_hirfati/features/pages/place_page/ui/page/place_page.dart';

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
      mapLink: '',
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
      mapLink: '',
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
      mapLink: '',
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
      mapLink: '',
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
      mapLink: '',
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
  Widget build(BuildContext context) {
    List<PlaceModel> filteredPlaces = places.where((place) {
      return place.name.contains(searchQuery) ||
          place.description.contains(searchQuery) ||
          place.subTitleDescription.contains(searchQuery) ||
          place.location.contains(searchQuery);
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
        trailing: CupertinoButtonComponent(
          child: const Icon(CupertinoIcons.camera, size: AppConstants.iconSize),
          onPressed: () {
            runCam(context);
          },
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        padding: const EdgeInsetsDirectional.only(end: 8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.padding,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const AppDivider(),
            itemBuilder: (context, index) {
              final place = filteredPlaces[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: PlaceCard(
                  place: place,
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PlacePage(place: place),
                    ),
                  ),
                ),
              );
            },
            itemCount: filteredPlaces.length,
          ),
        ),
      ),
    );
  }

  Future<dynamic> runCam(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              runImageGet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                const Icon(
                  CupertinoIcons.cube_box,
                  size: AppConstants.iconSize,
                ),
                const Text('صور منتجات'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              runImageGet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.map, size: AppConstants.iconSize),
                const SizedBox(width: 8),
                const Text('صور تراث'),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.of(context).pop();
          },
          child: const Text('اغلاق'),
        ),
      ),
    );
  }

  Future<dynamic> runImageGet(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              TakeImageBy.pickFromCamera();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                const Icon(CupertinoIcons.camera, size: AppConstants.iconSize),
                const Text('صورة من الكاميرا'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
              TakeImageBy.pickFromGallery();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.photo, size: AppConstants.iconSize),
                const SizedBox(width: 8),
                const Text('الصور من المعرض'),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.of(context).pop();
          },
          child: const Text('اغلاق'),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  final VoidCallback onPressed;

  const PlaceCard({super.key, required this.place, required this.onPressed});

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

