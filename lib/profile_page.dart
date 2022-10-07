import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/camera.dart';
import 'package:my_first_flutter_app/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  onPressed: CameraFunctions.openCamera,
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
                  onPressed: CameraFunctions.openGallery,
                  child: const Icon(Icons.photo_library_rounded),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Item ${(index + 1)}"),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      debugPrint("Item ${(index + 1)} selected");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
