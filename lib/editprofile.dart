import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.wand_stars_inverse),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ], //<Widget>[]
        backgroundColor: Color(0xff181A28),
        elevation: 0.0,
        // leadingWidth: MediaQuery.of(context).size.width,
        title: const Padding(
            padding: EdgeInsets.all(10), child: Text('Edit Profile')),
      ),
      backgroundColor: Color(0xff181A28),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                            FirebaseAuth.instance.currentUser!.photoURL!),
                      ),
                    ),
                  ],
                ),
                // Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Bio',
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
