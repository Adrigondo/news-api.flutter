import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
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
