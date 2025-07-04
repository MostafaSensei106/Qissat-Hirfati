import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TakeImageBy {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickFromCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) return File(photo.path);
    } catch (e) {
      print('خطأ أثناء استخدام الكاميرا: $e');
    }
    return null;
  }

  static Future<File?> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) return File(image.path);
    } catch (e) {
      print('خطأ أثناء اختيار صورة من الجالري: $e');
    }
    return null;
  }
}
