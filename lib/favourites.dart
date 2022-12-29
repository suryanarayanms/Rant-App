import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 70,
                      child: Image.asset('assets/images/rant_logo.png')),
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
          ],
        ),
      ),
    );
  }
}
