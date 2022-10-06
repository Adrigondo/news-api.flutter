import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
