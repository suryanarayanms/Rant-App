import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant_app/auth_service.dart';
import 'package:rant_app/editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.arrow_2_circlepath),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const EditProfile(),
                  ));
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              AuthService().signOut();
            },
          ),
        ], //<Widget>[]
        backgroundColor: Colors.black,
        // elevation: 50.0,
        // leadingWidth: MediaQuery.of(context).size.width,
        title:
            const Padding(padding: EdgeInsets.all(10), child: Text('Settings')),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              _context(),
              _context(),
              _context(),

// Rant Box ENDING
            ],
          ),
        ),
      ),
    );
  }

  _context() {
    return Column(
      children: const [],
    );
  }
}
