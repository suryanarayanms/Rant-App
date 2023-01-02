import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant_app/explorepage.dart';
import 'package:rant_app/favourites.dart';
import 'package:rant_app/home_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rant_app/profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int index = 0;
  final screen = [
    const HomePage(),
    const Explore(),
    // const NewRant(),
    const Favourites(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181A28),
      body: Center(
        child: screen[index],
      ),
      bottomNavigationBar: Container(
        color: const Color(0xff181A28),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            color: Colors.white,
            backgroundColor: const Color(0xff181A28),
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            gap: 8,
            onTabChange: (index) {
              setState(() => this.index = index);
            },
            // tabBorderRadius: 20,
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: CupertinoIcons.house_alt_fill,
                text: 'Home',
              ),
              GButton(
                icon: CupertinoIcons.search,
                text: 'Explore',
              ),
              // GButton(
              //   icon: CupertinoIcons.add,
              //   text: 'Rant',
              // ),
              GButton(
                icon: CupertinoIcons.heart_fill,
                text: 'Favourites',
              ),
              GButton(
                icon: CupertinoIcons.settings,
                text: 'Settings',
              )
            ],
          ),
        ),
      ),
    );
  }
}
