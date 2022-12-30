import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rant_app/auth_service.dart';

// import 'navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rant',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AuthService().handleAuthState())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDC0937),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: MediaQuery.of(context).size.height / 8,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-psd/3d-illustration-man-with-binoculars-top-cloud-topped-mountain_1150-53639.jpg?w=996&t=st=1672343811~exp=1672344411~hmac=94fae20c7049de1618359fc11e5d07e73dd2d22296b78ea16725d75d9e8b45a2',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 125.0, left: 50),
              child: Text(
                "The Best place\nyou can\nrant",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            GestureDetector(
              // onTap: () => Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             const MyNavigationBar()),
              //     (route) => false),

              onTap: () => {AuthService().signInWithGoogle()},
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 12, top: 12, bottom: 12),
                      child: Row(
                        children: [
                          Center(
                            child: SizedBox(
                                height: 30,
                                child: Image.asset(
                                    'assets/images/google-logo.png')),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              ' Sign in with Google ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
