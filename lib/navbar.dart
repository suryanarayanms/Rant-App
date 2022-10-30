import 'package:flutter/material.dart';
import 'package:rant_app/favourites.dart';
import 'package:rant_app/home_page.dart';
import 'package:rant_app/new_rant.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const NewRant(),
    const Favourites()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 25,
                    child: Image.asset(
                      'assets/images/home.png',
                    )),
              ),
              label: '',
              backgroundColor: Colors.grey.shade100),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 70,
                    child: Image.asset('assets/images/rant_logo.png')),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                  height: 25, child: Image.asset('assets/images/heart.png')),
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade100,
        currentIndex: _selectedIndex,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}
