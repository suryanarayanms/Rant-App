import 'package:flutter/material.dart';
import 'package:rant_app/favourites.dart';
import 'package:rant_app/home_page.dart';
import 'package:rant_app/new_rant.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  bool value = true;
  int _selectedIndex = 0;

  static late List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: _notifier,
        builder: (_, mode, __) {
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
                        height: 25,
                        child: Image.asset('assets/images/heart.png')),
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
        });
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const HomePage(),
      const NewRant(),
      const Favourites()
    ];
    setState(() {
      // bool temp = widget.value;
      // value = widget.value;
    });
  }
}
