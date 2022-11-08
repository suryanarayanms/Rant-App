import 'package:flutter/material.dart';
import 'package:rant_app/profile.dart';

class HomePage extends StatefulWidget {
  late bool value;

  HomePage(this.value, {Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: _notifier,
        builder: (_, mode, __) {
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Profile(widget.value)))
                          },
                          child: SizedBox(
                              height: 40,
                              child: Image.asset('assets/images/profile.png')),
                        ),
                        SizedBox(
                            height: 70,
                            child: Image.asset('assets/images/rant_logo.png')),
                        GestureDetector(
                          // onTap: () => Navigator.pop(context),
                          onTap: () {
                            _notifier.value = mode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                            if (_notifier.value == ThemeMode.light) {
                              widget.value = true;
                            } else {
                              widget.value = false;
                            }
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(widget.value
                                  ? Icons.dark_mode
                                  : Icons.light_mode)),
                        ),
                      ],
                    ),
                  ),

// Rant Box STARTING
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade100,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(20, 0, 0, 0),
                                blurRadius: 5,
                                offset: Offset(10, 10)),
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 5,
                                offset: Offset(-10, -10)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 20, right: 10, left: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 15, bottom: 15),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: SizedBox(
                                          height: 30,
                                          child: Image.asset(
                                              'assets/images/profile.png')),
                                    ),
                                    GestureDetector(
                                        onTap: () => {print(widget.value)},
                                        child: Text('Surya M S')),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: GestureDetector(
                                        // onTap: () => {print('Favourite')},
                                        child: SizedBox(
                                            height: 20,
                                            child: Image.asset(
                                                'assets/images/heart.png')),
                                      ),
                                    ),
                                    GestureDetector(
                                      // onTap: () => {print('Pop-up')},
                                      child: SizedBox(
                                          height: 20,
                                          child: Image.asset(
                                              'assets/images/dots.png')),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                '________________',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Text('Hi there'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
// Rant Box ENDING
                ],
              ),
            ),
          );
        });
  }
}
