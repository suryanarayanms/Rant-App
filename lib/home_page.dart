import 'package:flutter/material.dart';
import 'package:rant_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _bool = true;

class _HomePageState extends State<HomePage> {
  _changeTheme() {
    ThemeBuilder.of(context)?.theme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {print('Profile')},
                    child: SizedBox(
                        height: 40,
                        child: Image.asset('assets/images/profile.png')),
                  ),
                  SizedBox(
                      height: 70,
                      child: Image.asset('assets/images/rant_logo.png')),
                  GestureDetector(
                    // onTap: () => Navigator.pop(context) ,
                    onTap: () {
                      _changeTheme();
                      setState(() {
                        _bool = !_bool;
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:
                            Icon(!_bool ? Icons.dark_mode : Icons.light_mode)),
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
                    color: Colors.white,
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/images/profile.png')),
                              ),
                              const Text('Surya M S'),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: GestureDetector(
                                  onTap: () => {print('Favourite')},
                                  child: SizedBox(
                                      height: 20,
                                      child: Image.asset(
                                          'assets/images/heart.png')),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {print('Pop-up')},
                                child: SizedBox(
                                    height: 20,
                                    child:
                                        Image.asset('assets/images/dots.png')),
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
                            children: const [
                              Text('I could say that word but i cant.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
// Rant Box ENDING

// Rant Box STARTING
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/images/profile.png')),
                              ),
                              const Text('Surya M S'),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: SizedBox(
                                    height: 20,
                                    child:
                                        Image.asset('assets/images/heart.png')),
                              ),
                              SizedBox(
                                  height: 20,
                                  child: Image.asset('assets/images/dots.png')),
                            ],
                          ),
                        ),
                        const Text(
                          '________________',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: const [
                              Text('I could say that word but i cant.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
// Rant Box ENDING

// Rant Box STARTING
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/images/profile.png')),
                              ),
                              const Text('Surya M S'),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: SizedBox(
                                    height: 20,
                                    child:
                                        Image.asset('assets/images/heart.png')),
                              ),
                              SizedBox(
                                  height: 20,
                                  child: Image.asset('assets/images/dots.png')),
                            ],
                          ),
                        ),
                        const Text(
                          '________________',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: const [
                              Text('I could say that word but i cant.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
// Rant Box ENDING
// Rant Box STARTING
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/images/profile.png')),
                              ),
                              const Text('Surya M S'),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: SizedBox(
                                    height: 20,
                                    child:
                                        Image.asset('assets/images/heart.png')),
                              ),
                              SizedBox(
                                  height: 20,
                                  child: Image.asset('assets/images/dots.png')),
                            ],
                          ),
                        ),
                        const Text(
                          '________________',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: const [
                              Text('I could say that word but i cant.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
// Rant Box ENDING
// Rant Box STARTING
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/images/profile.png')),
                              ),
                              const Text('Surya M S'),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: SizedBox(
                                    height: 20,
                                    child:
                                        Image.asset('assets/images/heart.png')),
                              ),
                              SizedBox(
                                  height: 20,
                                  child: Image.asset('assets/images/dots.png')),
                            ],
                          ),
                        ),
                        const Text(
                          '________________',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: const [
                              Text('I could say that word but i cant.'),
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
  }
}
