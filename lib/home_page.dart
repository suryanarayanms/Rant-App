import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // onTap: () => Navigator.pop(context),
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Home Page"),
            ),
          ),
        ),
      ),
    );
  }
}
