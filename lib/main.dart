// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_flutter_app/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.sourceSansProTextTheme(),
      ),
      title: "Informa2",
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      /* home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ), */
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Informa2"),
        ),
        body: pages[currentPage],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Floating Action Button");
          },
          child: const Icon(Icons.anchor),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "HOME"),
            NavigationDestination(icon: Icon(Icons.wysiwyg), label: "News")
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ));
  }
}

TextStyle mainTextStyle({required TextStyle textStyle}) {
  return GoogleFonts.sourceSansPro(textStyle: textStyle);
}
