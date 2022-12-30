import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rant_app/auth_service.dart';
import 'package:rant_app/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                              builder: (context) => const Profile()))
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
                      AuthService().signOut();
                    },
                    child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(Icons.dark_mode)),
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/images/profile.png')),
                              ),
                              GestureDetector(
                                  onTap: () => {},
                                  child: const Text('Surya M S')),
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
                              Text('Hi there'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Login details \n"),
                      Text(
                          'User Name:   ${FirebaseAuth.instance.currentUser!.displayName!}\n'),
                      Text(
                          'Email ID:    ${FirebaseAuth.instance.currentUser!.email!}\n'),
                      Text(
                          'UID:         ${FirebaseAuth.instance.currentUser!.uid}'),
                    ],
                  ),
                ),
              ),
            ),
// Rant Box ENDING
          ],
        ),
      ),
    );
  }
}
