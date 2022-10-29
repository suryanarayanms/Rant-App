import 'package:flutter/material.dart';
import 'package:rant_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
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
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 250.0),
          child: Text("Rant"),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 100, left: 30.0, bottom: 50),
              child: Text("Sign in"),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Container(
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Sign in with Google"),
              )),
        ),
      ],
    ));
  }
}
