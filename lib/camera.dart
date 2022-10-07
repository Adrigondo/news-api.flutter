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
  static void openCamera() async {
    XFile? picture = await imagePicker.pickImage(source: ImageSource.camera);
    debugPrint(picture.toString());
  }

  static void openGallery() async {
    XFile? picture = await imagePicker.pickImage(source: ImageSource.gallery);
    debugPrint(picture.toString());
  }
}
