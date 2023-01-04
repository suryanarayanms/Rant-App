import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rant_app/auth_service.dart';
import 'package:rant_app/edit_rant.dart';
import 'package:rant_app/userprofile.dart';
import 'package:rant_app/view_image.dart';

import 'Provider/theme.dart';
import 'editprofile.dart';

class Profilee extends StatefulWidget {
  const Profilee({Key? key}) : super(key: key);

  @override
  State<Profilee> createState() => _ProfileeState();
}

class _ProfileeState extends State<Profilee> {
  late CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('rants');
  late CollectionReference following = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('following');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: <Widget>[
              IconButton(
                icon: const Icon(CupertinoIcons.arrow_2_circlepath),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditProfile(
                            accountName:
                                context.watch<TemporaryData>().accountName,
                            bio: context.watch<TemporaryData>().bio,
                            profilepic:
                                context.watch<TemporaryData>().profilepic),
                      ));
                },
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.back),
                onPressed: () {
                  AuthService().signOut();
                  // context.read<TemporaryData>().clearData();
                  // context.read<TemporaryData>().clearData();
                },
              ),
            ], //<Widget>[]
            backgroundColor: const Color(0xff181A28),
            elevation: 0,
            // elevation: 50.0,
            // leadingWidth: MediaQuery.of(context).size.width,
            title: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Settings'),
            ),
          ),
          backgroundColor: const Color(0xff181A28),
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 220,
                  flexibleSpace: FlexibleSpaceBar(background: _profile()),
                  backgroundColor: const Color(0xff181A28),
                  pinned: true,
                  floating: true,
                  bottom: const TabBar(
                    physics: BouncingScrollPhysics(),
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: 'Rants',
                      ),
                      Tab(
                        text: 'Friends',
                        // child: Text(''),
                      ),
                      Tab(
                        text: 'Homies',
                      )
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[_rants(), _following(), _followers()],
            ),
          )),
    );
  }

  _profile() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 20, bottom: 20, right: 20),
                    child: Container(
                      margin: const EdgeInsets.all(10),
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
                      height: 120,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          context.watch<TemporaryData>().profilepic,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.watch<TemporaryData>().accountName,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    context.watch<TemporaryData>().bio,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _rants() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder(
          stream: following.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  dynamic doc = snapshot.data?.docs[index].data();

                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff181A28),
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
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 25, right: 10, left: 10),
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        // margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  blurRadius: 10,
                                                  offset: const Offset(5, 5)),
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                          255, 37, 39, 61)
                                                      .withOpacity(0.5),
                                                  blurRadius: 10,
                                                  offset: const Offset(-5, -5)),
                                            ],
                                            color: const Color(0xff181A28)),
                                        height: 55,
                                        width: 55,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.network(
                                            context
                                                .watch<TemporaryData>()
                                                .profilepic,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () => {},
                                        child: Text(
                                          context
                                              .watch<TemporaryData>()
                                              .accountName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () => {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          isDismissible: true,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.black),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0,
                                                    bottom: 20,
                                                    left: 20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Center(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20.0),
                                                      child: Container(
                                                        height: 4,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                    )),
                                                    ListTile(
                                                      leading: const Icon(
                                                        Icons.photo,
                                                        color: Colors.white70,
                                                      ),
                                                      title: const Text(
                                                        'Share as Image',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                        Icons.note,
                                                        color: Colors.white70,
                                                      ),
                                                      title: const Text(
                                                        'Share as Text',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                        Icons
                                                            .woo_commerce_outlined,
                                                        color: Colors.white70,
                                                      ),
                                                      title: const Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        String rantImage =
                                                            doc['image'];
                                                        String rantText =
                                                            doc['rant'];
                                                        String rantId =
                                                            doc['rantid'];
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: ((context) => EditRant(
                                                                    rant_textt:
                                                                        rantText,
                                                                    rant_image:
                                                                        rantImage,
                                                                    rant_id:
                                                                        rantId))));
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                        Icons.delete_rounded,
                                                        color: Colors.white70,
                                                      ),
                                                      title: const Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);

                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(uid)
                                                            .collection('rants')
                                                            .doc(doc['rantid'])
                                                            .delete();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      },
                                      child: SizedBox(
                                          height: 20,
                                          child: Image.asset(
                                            'assets/images/dots.png',
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 20,
                                        right: 10,
                                        bottom: 10),
                                    child: Text(
                                      '${doc['rant']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15,
                                      ),
                                      child: (doc['image'] != '')
                                          ? image(doc)
                                          : Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              clipBehavior: Clip.antiAlias,
                                              child: Image.network(
                                                url,
                                                width: 1000,
                                                height: 0,
                                              ),
                                            )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            } else {
              return const Center(child: Text('dsdfsdfsd'));
            }
          }),
    );
  }

  String temp = '';

  image(doc) {
    return GestureDetector(
      onTap: () => {
        temp = doc['image'],
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => ViewImage(image: temp)))),
        // temp = '',
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(5, 5)),
              BoxShadow(
                  color: const Color.fromARGB(255, 37, 39, 61).withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(-5, -5)),
            ],
            color: const Color(0xff181A28)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: Image.network('${doc['image']}'),
        ),
      ),
    );
  }

  String url = 'https://wallpapercave.com/dwp1x/wp5756429.jpg';

  _following() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
                  top: 5.0, bottom: 25, right: 10, left: 10),
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
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserProfile()))
                              },
                              child: SizedBox(
                                height: 55,
                                width: 55,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    context.watch<TemporaryData>().profilepic,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserProfile()))
                          },
                          child: Text(
                            FirebaseAuth.instance.currentUser!.displayName!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff181A28),
                                    borderRadius: BorderRadius.circular(10),
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
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Unfollow',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                              // child: Icon(Icons.star),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _followers() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
                  top: 5.0, bottom: 25, right: 10, left: 10),
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
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserProfile()))
                              },
                              child: SizedBox(
                                height: 55,
                                width: 55,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    context.watch<TemporaryData>().profilepic,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserProfile()))
                          },
                          child: Text(
                            context.watch<TemporaryData>().accountName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff181A28),
                                    borderRadius: BorderRadius.circular(10),
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
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Remove',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                              // child: Icon(Icons.star),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
