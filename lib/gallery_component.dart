import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_app/photo_view_screen.dart';

class GalleryComponent extends StatefulWidget {
  final List<XFile> pictures;
  const GalleryComponent({super.key, required this.pictures});

  @override
  State<GalleryComponent> createState() => _GalleryComponentState();
}

class _GalleryComponentState extends State<GalleryComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: widget.pictures.length,
        itemBuilder: (BuildContext context, int index) {
          File currentImage = File(widget.pictures[index].path);
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PhotoViewScreen(imageFile: currentImage),
                ),
              );
            },
            child: Image.file(
              currentImage,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
