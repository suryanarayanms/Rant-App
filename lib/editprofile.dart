import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final String accountName;
  final String bio;
  final String profilepic;
  const EditProfile(
      {Key? key,
      required this.accountName,
      required this.bio,
      required this.profilepic})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('rants');

  Future<dynamic> dataretrive() async {
    doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    name = doc.data()!['accountName'];
    bioo = doc.data()!['bio'];
    data = doc.data()!['profilepic'];

    return doc;
  }

  var doc;
  String? name;
  String? bioo;
  String? data;
  final String _myrant = '';
  String _accountName = '';
  String _bio = '';
  File? imageFile;
  XFile? imagePath;
  File? imagepicked;
  var uploadPath = '';
  final ImagePicker _picker = ImagePicker();
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = "profilepic";

  @override
  Widget build(BuildContext context) {
    dataretrive();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            tooltip: 'Save',
            icon: const Icon(CupertinoIcons.wand_stars_inverse),
            onPressed: () {
              if (_accountName == '' && _bio == '' && imagepicked == null) {
                Navigator.pop(context);
              } else if (_accountName != '' &&
                  _bio == '' &&
                  imagepicked == null) {
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  "accountName": _accountName,
                });
                Navigator.pop(context);
              } else if (_accountName == '' &&
                  _bio != '' &&
                  imagepicked == null) {
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  "bio": _bio,
                });
                Navigator.pop(context);
              } else if (_accountName == '' &&
                  _bio == '' &&
                  imagepicked != null) {
                setState(() {
                  isLoading = true;
                });
                String uploadFileName =
                    DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
                Reference reference = storageRef
                    .ref()
                    .child(collectionName)
                    .child(uploadFileName);
                UploadTask uploadTask =
                    reference.putFile(File(imagePath!.path));

                setState(() {
                  imageFile = File(imagePath!.path);
                });
                uploadTask.whenComplete(
                  () async {
                    uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      "profilepic": uploadPath,
                    });
                  },
                );
                Navigator.pop(context);
              } else if (_accountName != '' &&
                  _bio != '' &&
                  imagepicked == null) {
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  "bio": _bio,
                  "accountName": _accountName,
                });
                Navigator.pop(context);
              } else if (_accountName != '' &&
                  _bio == '' &&
                  imagepicked != null) {
                setState(() {
                  isLoading = true;
                });
                String uploadFileName =
                    DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
                Reference reference = storageRef
                    .ref()
                    .child(collectionName)
                    .child(uploadFileName);
                UploadTask uploadTask =
                    reference.putFile(File(imagePath!.path));

                setState(() {
                  imageFile = File(imagePath!.path);
                });
                uploadTask.whenComplete(
                  () async {
                    uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      "accountName": _accountName,
                      "profilepic": uploadPath,
                    });
                  },
                );
                Navigator.pop(context);
              } else if (_accountName == '' &&
                  _bio != '' &&
                  imagepicked != null) {
                setState(() {
                  isLoading = true;
                });
                String uploadFileName =
                    DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
                Reference reference = storageRef
                    .ref()
                    .child(collectionName)
                    .child(uploadFileName);
                UploadTask uploadTask =
                    reference.putFile(File(imagePath!.path));

                setState(() {
                  imageFile = File(imagePath!.path);
                });
                uploadTask.whenComplete(
                  () async {
                    uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({"profilepic": uploadPath, "bio": _bio});
                  },
                );
                Navigator.pop(context);
              } else if (_accountName != '' &&
                  _bio != '' &&
                  imagepicked != null) {
                setState(() {
                  isLoading = true;
                });
                String uploadFileName =
                    DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
                Reference reference = storageRef
                    .ref()
                    .child(collectionName)
                    .child(uploadFileName);
                UploadTask uploadTask =
                    reference.putFile(File(imagePath!.path));

                setState(() {
                  imageFile = File(imagePath!.path);
                });
                uploadTask.whenComplete(
                  () async {
                    uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      "bio": _bio,
                      "accountName": _accountName,
                      "profilepic": uploadPath,
                    });
                  },
                );
                Navigator.pop(context);
              }
            },
          ),
        ], //<Widget>[]
        backgroundColor: const Color(0xff181A28),
        elevation: 0.0,
        leadingWidth: 80,
        // leadingWidth: MediaQuery.of(context).size.width,
        // leading: GestureDetector(
        //   onTap: (() => Navigator.pop(context)),
        //   child: Icon(
        //     CupertinoIcons.delete,
        //   ),
        // ),
        title: const Text('Edit Profile'),
      ),
      backgroundColor: const Color(0xff181A28),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [gallery()]),
      ),
    );
  }

  gallery() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Card(
                    color: const Color(0xff181A28),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.antiAlias,
                    child: imagepicked != null
                        ? GestureDetector(
                            onTap: (() => {imagepicker()}),
                            child: Image.file(
                              imagepicked!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : GestureDetector(
                            onTap: (() => {imagepicker()}),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: const Offset(5, 5)),
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 37, 39, 61)
                                              .withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: const Offset(-5, -5)),
                                ],
                                color: const Color(0xff181A28),
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  widget.profilepic,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (() => {imagedeleter()}),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(5, 5)),
                        BoxShadow(
                            color: const Color.fromARGB(255, 37, 39, 61)
                                .withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(-5, -5)),
                      ],
                      color: const Color(0xff181A28),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  maxLength: 17,
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  onChanged: (accountName) {
                    _accountName = accountName;
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white24.withOpacity(0.5)),
                    hintText: widget.accountName,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                TextField(
                  maxLength: 100,
                  maxLines: 5,
                  autofocus: false,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                  onChanged: (bio) {
                    _bio = bio;
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white24.withOpacity(0.5)),
                    hintText: widget.bio,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  imagedeleter() {
    setState(() {
      imagepicked = null;
      uploadPath = '';
    });
  }

  imagepicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final imageFile = File(image.path);
        setState(() {
          imagepicked = imageFile;
        });
      } finally {}

      setState(() {
        imagePath = image;
        imgname = image.name.toString();
      });
    }
  }

  uploadImage() async {
    if (imgname != '') {
      setState(() {
        isLoading = true;
      });
      String uploadFileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
      Reference reference =
          storageRef.ref().child(collectionName).child(uploadFileName);
      UploadTask uploadTask = reference.putFile(File(imagePath!.path));

      setState(() {
        imageFile = File(imagePath!.path);
      });
      await uploadTask.whenComplete(
        () async {
          uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

          DocumentReference myDoc = FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("rants")
              .doc();

          FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("rants")
              .doc(myDoc.id)
              .set({
            "rant": _myrant,
            "rantid": myDoc.id,
            "image": uploadPath,
            "likes": 0,
            "uid": FirebaseAuth.instance.currentUser!.uid,
          });
        },
      );
    } else {
      DocumentReference myDoc = FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("rants")
          .doc();

      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("rants")
          .doc(myDoc.id)
          .set({
        "rant": _myrant,
        "rantid": myDoc.id,
        "image": "",
        "likes": 0,
        "uid": FirebaseAuth.instance.currentUser!.uid,
      });
    }
  }
}

bool isLoading = false;
String? imgname = '';

const String url =
    'https://th.bing.com/th/id/OIP.D7E68k2v1S5tdBs-nZx7zAHaEK?pid=ImgDet&w=1367&h=769&rs=1';
