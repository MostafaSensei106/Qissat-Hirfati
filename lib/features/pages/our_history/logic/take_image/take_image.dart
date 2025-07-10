import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TakeImageBy {
  static final ImagePicker _picker = ImagePicker();

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

  static Future<File?> pickFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      Exception('خطاء اثناء اختيار صورة من المعرض: $e');
    }
    return null;
  }
}
