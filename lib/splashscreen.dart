import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rant_app/Provider/theme.dart';

import 'package:rant_app/auth_service.dart';

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
      backgroundColor: context.watch<TemporaryData>().theme
          ? const Color(0xffDC0937)
          : Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: MediaQuery.of(context).size.height / 8,
        ),
      ),
    );
  }
}
