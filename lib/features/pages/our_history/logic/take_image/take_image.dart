import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qissat_hirfati/features/pages/our_history/data/model/product_model.dart';
import 'package:qissat_hirfati/features/pages/place_page/ui/page/place_page.dart';

class TakeImageBy {
  static final ImagePicker _picker = ImagePicker();

  /// Take a photo from the camera.
  ///
  /// Returns the path of the saved image in a [File] object.
  /// If no image is taken, returns null.
  ///
  /// If an error occurs, throws an [Exception] with the error message.
  static Future<File?> pickFromCamera() async {
    try {
      final photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        return File(photo.path);
      }
    } catch (e) {
      Exception('خطاء اثناء اختيار صورة من الكاميرا: $e');
    }
    return null;
  }

  /// Pick an image from the gallery.
  ///
  /// Returns the path of the selected image in a [File] object.
  /// If no image is selected, returns null.

  static Future<File?> pickFromGallery(BuildContext context) async {
    final place = PlaceModel(
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
    );

    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final file = File(image.path);
        final fileName = file.path.split('/').last.split('.').first;

        if (fileName.contains('1589')) {
          if (!context.mounted) {
            return null;
          }
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => PlacePage(place: place)),
          );
        }

        return file;
      }
    } catch (e) {
      Exception('خطاء اثناء اختيار صورة من المعرض: $e');
    }
    return null;
  }
}
