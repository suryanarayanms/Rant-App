import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rant_app/auth_service.dart';

class TemporaryData extends ChangeNotifier {
  // Theme Changer
  bool _theme = true;
  bool get theme => _theme;

  void changeTheme() {
    _theme = !_theme;
    notifyListeners();
  }

  // Tab
  String? data;
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  retrieveData() async {
    var doc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    data = doc.data()!['email'];

    notifyListeners();
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => AuthService().handleAuthState(),
    //     ));
  }

  int _index = 0;
  int get index => _index;

  void rant() {
    _index = 0;
    notifyListeners();
  }

  void following() {
    _index = 1;
    notifyListeners();
  }

  void followers() {
    _index = 2;
    notifyListeners();
  }
}
