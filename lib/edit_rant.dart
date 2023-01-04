import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditRant extends StatefulWidget {
  final String rant_id;
  final String rant_textt;
  final String rant_image;
  const EditRant({
    Key? key,
    required this.rant_id,
    required this.rant_textt,
    required this.rant_image,
  }) : super(key: key);

  @override
  State<EditRant> createState() => EditRantState();
}

class EditRantState extends State<EditRant> {
  late String rant_id = widget.rant_id;
  // late String rant_image = widget.rant_image;
  late String rant_text = widget.rant_textt;
  var doc;
  late String _myrant = '';
  File? imageFile;
  XFile? imagePath;
  File? imagepicked;
  var uploadPath = '';
  String rant = '';
  String rantimage = '';
  var ranting;
  String accountName = '';
  String profile = '';
  final ImagePicker _picker = ImagePicker();
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = "rantImages";
  Future<dynamic> retrieve() async {
    doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    accountName = doc.data()!['accountName'];
    profile = doc.data()!['profilepic'];
    return doc;
  }

  Future<dynamic> retrieverant() async {
    ranting = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('rants')
        .doc(widget.rant_id)
        .get();

    rant = ranting.data()!['rant'];
    rantimage = ranting.data()!['image'];
    return ranting;
  }

  @override
  Widget build(BuildContext context) {
    retrieve();
    retrieverant();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            tooltip: 'Post',
            icon: const Icon(Icons.podcasts_outlined),
            onPressed: () {
              // UPLOAD IMAGE

              if (_myrant == rant_text && imagepicked == null) {
                Navigator.pop(context);
              } else if ((_myrant != rant_text && _myrant != '') &&
                  imagepicked == null) {
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("rants")
                    .doc(rant_id)
                    .update({
                  "rant": _myrant,
                });
                Navigator.pop(context);
              } else if (_myrant == '' && imagepicked != null) {
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
                        .collection("rants")
                        .doc(rant_id)
                        .update({
                      "rant": rant,
                      "image": uploadPath,
                    });
                  },
                );
                Navigator.pop(context);
              } else if ((_myrant != rant_text && _myrant != '') &&
                  imagepicked != null) {
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
                        .collection("rants")
                        .doc(rant_id)
                        .update({
                      "rant": _myrant,
                      "image": uploadPath,
                    });
                  },
                );
                Navigator.pop(context);
              } else {
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
        title: const Text('Rant'),
      ),
      backgroundColor: const Color(0xff181A28),
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
                    offset: const Offset(5, 5)),
                BoxShadow(
                    color:
                        const Color.fromARGB(255, 37, 39, 61).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(-5, -5)),
              ],
              color: const Color(0xff181A28),
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
                            height: 55,
                            width: 55,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                profile,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          accountName,
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
                        child: TextFormField(
                          initialValue: widget.rant_textt,
                          autofocus: false,
                          keyboardType: TextInputType.streetAddress,
                          textInputAction: TextInputAction.newline,
                          maxLines: 10,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
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
                    offset: const Offset(5, 5)),
                BoxShadow(
                    color:
                        const Color.fromARGB(255, 37, 39, 61).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(-5, -5)),
              ],
              color: const Color(0xff181A28),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    color: const Color(0xff181A28),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.antiAlias,
                    child: imagepicked != null
                        ? GestureDetector(
                            onTap: (() => {imagepicker()}),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // height: 150,
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
                                child: Image.file(
                                  imagepicked!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : (widget.rant_image != '')
                            ? GestureDetector(
                                onTap: (() => {imagepicker()}),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  // height: 150,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(5, 5)),
                                      BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 37, 39, 61)
                                              .withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(-5, -5)),
                                    ],
                                    color: const Color(0xff181A28),
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.network(
                                      widget.rant_image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                                          color: const Color.fromARGB(
                                                  255, 37, 39, 61)
                                              .withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(-5, -5)),
                                    ],
                                    color: const Color(0xff181A28),
                                  ),
                                  child: Card(
                                    color: const Color(0xff181A28),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    clipBehavior: Clip.antiAlias,
                                    child: const Center(
                                        child: Text(
                                      'G A L L E R Y',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
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
