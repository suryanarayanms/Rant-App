import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rant_app/main.dart';
import 'package:rant_app/navbar.dart';

String name = '';
String uid = '';
String email = '';
String following = '';
String data = '';

class AuthService {
  Future<dynamic> retrieveData() async {
    var doc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return data = doc.data()!['following'];
  }

// keytool -exportcert -list -v -alias upload-keystore -keystore C:/Users/Acer/upload-keystore.jks
  //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            name = FirebaseAuth.instance.currentUser!.displayName!;
            uid = FirebaseAuth.instance.currentUser!.uid;
            email = FirebaseAuth.instance.currentUser!.email!;

            Future d = retrieveData();
            print('${d}');

            if (data == '0') {
              print(data + 'if loop');
              FirebaseFirestore.instance.collection("users").doc(uid).set({
                "uid": uid,
                "name": name,
                "email": email,
                "following": following
              });
            }
            late DocumentReference documentReference =
                FirebaseFirestore.instance.collection("users").doc();
            return const MyNavigationBar();
          } else {
            return const LoginPage();
          }
        });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Sign out
  signOut() async {
    GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    String name = '';
    String uid = '';
    String fol = '';
  }
}
