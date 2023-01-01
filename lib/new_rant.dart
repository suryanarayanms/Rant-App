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
        backgroundColor: Colors.black,
        // elevation: 50.0,
        leadingWidth: 80,
        // leadingWidth: MediaQuery.of(context).size.width,
        // leading: GestureDetector(
        //   onTap: (() => Navigator.pop(context)),
        //   child: Icon(
        //     CupertinoIcons.delete,
        //   ),
        // ),
        title: const Padding(padding: EdgeInsets.all(10), child: Text('Rant')),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(children: [_context(), gallery()])),
      ),
    );
  }

  _context() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                        cursorColor: Colors.black,
                        onChanged: (myrant) {
                          _myrant = myrant;
                        },
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 15),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
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
                            // margin: const EdgeInsets.all(10),
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            child: const Center(
                              child: Text(
                                'G A L L E R Y',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (() => {imagepicker()}),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(CupertinoIcons.photo),
                        )),
                    const Spacer(),
                    GestureDetector(
                        onTap: (() => {imagedeleter()}),
                        child: const Icon(CupertinoIcons.delete)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  imagedeleter() {
    setState(() {
      imagepicked = null;
      uploadPath = '';
    });
  }

  File? imagepicked;
  var uploadPath = '';
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
