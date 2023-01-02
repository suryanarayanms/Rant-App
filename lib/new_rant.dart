import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewRant extends StatefulWidget {
  const NewRant({Key? key}) : super(key: key);
  @override
  State<NewRant> createState() => NewRantState();
}

class NewRantState extends State<NewRant> {
  String _myrant = '';
  File? imageFile;
  XFile? imagePath;
  File? imagepicked;
  var uploadPath = '';
  final ImagePicker _picker = ImagePicker();
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = "rantImages";

  @override
  Widget build(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            tooltip: 'Post',
            icon: const Icon(Icons.podcasts_outlined),
            onPressed: () {
              // UPLOAD IMAGE
              if (_myrant != '') {
                if (imagepicked != null) {
                  if (imgname != '') {
                    setState(() {
                      isLoading = true;
                    });
                    String uploadFileName =
                        DateTime.now().millisecondsSinceEpoch.toString() +
                            '.jpg';
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
                        uploadPath =
                            await uploadTask.snapshot.ref.getDownloadURL();

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
                // uploadImage();
                setState(() {
                  imgname = '';
                });

                Navigator.pop(context);
              } else {}
            },
          ),
        ], //<Widget>[]
        backgroundColor: Color(0xff181A28),
        elevation: 0.0,
        leadingWidth: 80,
        // leadingWidth: MediaQuery.of(context).size.width,
        // leading: GestureDetector(
        //   onTap: (() => Navigator.pop(context)),
        //   child: Icon(
        //     CupertinoIcons.delete,
        //   ),
        // ),
        title: Text('Rant'),
      ),
      backgroundColor: Color(0xff181A28),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [_context(), gallery()]),
      ),
    );
  }

  _context() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(5, 5)),
                BoxShadow(
                    color: Color.fromARGB(255, 37, 39, 61).withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(-5, -5)),
              ],
              color: Color(0xff181A28),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 10, right: 10, left: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                      top: 15,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(
                            height: 40,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                  FirebaseAuth.instance.currentUser!.photoURL!),
                            ),
                          ),
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser!.displayName!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.streetAddress,
                          textInputAction: TextInputAction.newline,
                          maxLines: 10,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          onChanged: (myrant) {
                            _myrant = myrant;
                          },
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white10.withOpacity(0.2)),
                            hintText: 'Type something you would like to rant',
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  image() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.antiAlias,
        child: Image.network(url),
      ),
    );
  }

  gallery() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(5, 5)),
                BoxShadow(
                    color: Color.fromARGB(255, 37, 39, 61).withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(-5, -5)),
              ],
              color: Color(0xff181A28),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    color: Color(0xff181A28),
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
                                      offset: Offset(5, 5)),
                                  BoxShadow(
                                      color: Color.fromARGB(255, 37, 39, 61)
                                          .withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: Offset(-5, -5)),
                                ],
                                color: Color(0xff181A28),
                              ),
                              child: const Center(
                                child: Text(
                                  'G A L L E R Y',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (() => {imagepicker()}),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.photo,
                              color: Colors.white,
                            ),
                          )),
                      const Spacer(),
                      GestureDetector(
                          onTap: (() => {imagedeleter()}),
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
