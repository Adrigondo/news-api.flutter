import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_app/camera.dart';
import 'package:my_first_flutter_app/gallery_component.dart';
import 'package:my_first_flutter_app/main.dart';
import 'package:my_first_flutter_app/users_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<XFile> pictures = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color.fromARGB(255, 225, 225, 225);
                      }
                      return Colors.white;
                    }),
                    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                        (Set<MaterialState> states) {
                      var disableState = mainTextStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      );
                      var currentState = mainTextStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      );
                      var pressedState = mainTextStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      );
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.focused)) {
                        return pressedState;
                      } else if (states.contains(MaterialState.disabled)) {
                        return disableState;
                      }
                      return currentState;
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      } else if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.purple.shade600;
                    }),
                    overlayColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.purple;
                      }
                      return Colors.purple.shade200;
                    }),
                    side:
                        MaterialStateProperty.resolveWith<BorderSide>((states) {
                      Color borderColor;

                      if (states.contains(MaterialState.disabled)) {
                        borderColor = Colors.grey;
                      } else if (states.contains(MaterialState.pressed)) {
                        borderColor = Colors.purple.shade600;
                      } else {
                        borderColor = Colors.purple;
                      }

                      return BorderSide(color: borderColor, width: 2);
                    }),
                    shape:
                        MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50));
                    }),
                  ),
                  onPressed: onClickOpenCamera,
                  child: const Icon(Icons.photo_camera),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color.fromARGB(255, 225, 225, 225);
                      }
                      return Colors.white;
                    }),
                    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                        (Set<MaterialState> states) {
                      var disableState = mainTextStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      );
                      var currentState = mainTextStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      );
                      var pressedState = mainTextStyle(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      );
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.focused)) {
                        return pressedState;
                      } else if (states.contains(MaterialState.disabled)) {
                        return disableState;
                      }
                      return currentState;
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      } else if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.purple.shade600;
                    }),
                    overlayColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.purple;
                      }
                      return Colors.purple.shade200;
                    }),
                    side:
                        MaterialStateProperty.resolveWith<BorderSide>((states) {
                      Color borderColor;

                      if (states.contains(MaterialState.disabled)) {
                        borderColor = Colors.grey;
                      } else if (states.contains(MaterialState.pressed)) {
                        borderColor = Colors.purple.shade600;
                      } else {
                        borderColor = Colors.purple;
                      }

                      return BorderSide(color: borderColor, width: 2);
                    }),
                    shape:
                        MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50));
                    }),
                  ),
                  onPressed: onClickOpenGallery,
                  child: const Icon(Icons.photo_library_rounded),
                ),
              ],
            ),
            // const UsersList(),
            GalleryComponent(pictures: pictures),
          ],
        ),
      ),
    );
  }

  void onClickOpenCamera() async {
    XFile? picture = await CameraFunctions.openCamera();
    if (picture != null) {
      setState(() {
        pictures.add(picture);
      });
    }
  }

  void onClickOpenGallery() async {
    XFile? picture = await CameraFunctions.openGallery();
    if (picture != null) {
      setState(() {
        pictures.add(picture);
      });
    }
  }
}
