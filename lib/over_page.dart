import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/main.dart';

class OverPage extends StatefulWidget {
  const OverPage({super.key});

  @override
  State<OverPage> createState() => _OverPageState();
}

class _OverPageState extends State<OverPage> {
  bool isTrue = false;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Detail View"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Save");
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/news_1.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              color: Colors.blueGrey,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: const Center(
                child: Text(
                  "I'm a text for fill the space xD",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    debugPrint("I'm an elevated button");
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      backgroundColor: isTrue && isChecked == true
                          ? Colors.amber
                          : Colors.teal),
                  child: const Text("Elevated Button"),
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
                    /* shadowColor: MaterialStateProperty.resolveWith<Color>((states) {
                    return Colors.red;
                  }), */
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
                  onPressed: () {
                    debugPrint("I'm an oultined button");
                  },
                  // onPressed: null,
                  child: const Text("Outlined Button"),
                ),
                TextButton(onPressed: () {}, child: const Text("Text button"))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Switch(
                      value: isTrue,
                      onChanged: (bool newBool) {
                        debugPrint("$newBool");
                        setState(() {
                          isTrue = newBool;
                        });
                      },
                    ),
                    const Text("I'm a row"),
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newBool) {
                        setState(() {
                          isChecked = newBool;
                          /* if (newBool != null) {
                            isTrue = newBool;
                          } else {
                            isTrue = false;
                          } */
                        });
                      },
                    ),
                  ],
                ),
                onTap: () {
                  debugPrint("I'm a row tapped!");
                },
              ),
            ),
            Image.network(
                "https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
          ],
        ),
      ),
    );
  }
}
