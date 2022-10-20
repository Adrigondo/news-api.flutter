import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  final File imageFile;
  const PhotoViewScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: FileImage(imageFile),
    );
  }
}
