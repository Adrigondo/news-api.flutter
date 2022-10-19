import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CameraFunctions {
  static final imagePicker = ImagePicker();
  static Future<XFile?> openCamera({Function? callback}) async {
    XFile? picture = await imagePicker.pickImage(source: ImageSource.camera);
    debugPrint(picture.toString());
    if (callback != null) {
      callback(picture);
    }
    return picture;
  }

  static Future<XFile?> openGallery({Function? callback}) async {
    XFile? picture = await imagePicker.pickImage(source: ImageSource.gallery);
    debugPrint(picture.toString());
    if (callback != null) {
      callback(picture);
    }
    return picture;
  }
}
