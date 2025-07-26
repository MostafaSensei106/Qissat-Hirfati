import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TakeImageBy {
  static final ImagePicker _picker = ImagePicker();

  /// Take a photo from the camera.
  ///
  /// Returns the path of the saved image in a [File] object.

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
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
