import 'package:flutter/material.dart';

class OverPage extends StatefulWidget {
  const OverPage({super.key});

  @override
  State<OverPage> createState() => _OverPageState();
}

class _OverPageState extends State<OverPage> {
  bool dynamicButtonPressed = false;
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
      ),
      body: Column(
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
          ElevatedButton(
            onPressed: () {
              debugPrint("I'm an artist");
            },
            child: const Text("Elevated Button"),
          ),
          OutlinedButton(
            style: ButtonStyle(
              /* backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return Colors.white;
              }), */
              overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
                return Colors.purple;
                /* if (states.contains(MaterialState.pressed)) {
                }
                return Colors.; */
              }),
              /* shadowColor: MaterialStateProperty.resolveWith<Color>((states) {
                // return Colors.blue.shade900;
              }), */
              side: MaterialStateProperty.resolveWith((states) {
                Color _borderColor;

                if (states.contains(MaterialState.disabled)) {
                  _borderColor = Colors.pink.shade800;
                } else if (states.contains(MaterialState.pressed)) {
                  _borderColor = Colors.purple.shade600;
                } else {
                  _borderColor = Colors.purple;
                }

                return BorderSide(color: _borderColor, width: 2);
              }),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16));
              }),
            ),
            onPressed: () {
              debugPrint("I'm an oultined button");
              debugPrint("Button pressed: $dynamicButtonPressed");
              changeStyle();
            },
            child: Text(
              "Outlined Button",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                decorationThickness: 4,
                fontFamily: "Lato",
                color: dynamicButtonPressed
                    ? Colors.purple.shade900
                    : Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeStyle() {
    setState(() {
      dynamicButtonPressed = true;
    });
  }
}
