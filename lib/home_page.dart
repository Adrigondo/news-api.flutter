import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/over_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const OverPage();
            }),
          );
        },
        child: const Text("This is a button"),
      ),
    );
  }
}
