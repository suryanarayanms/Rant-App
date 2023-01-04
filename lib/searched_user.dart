import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:rant_app/Provider/theme.dart';
import 'package:rant_app/view_image.dart';

class SearchedUser extends StatefulWidget {
  final String uid;

  const SearchedUser({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<SearchedUser> createState() => _SearchedUserState();
}

class _SearchedUserState extends State<SearchedUser> {
  late CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(widget.uid)
      .collection('rants');

  DocumentReference myDoc = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("rants")
      .doc();
  var doc;
  bool following = false;
  String followsname = '';
  String followsprofilepic = '';
  String followsbio = '';
  String name = '';
  String profilepic = '';
  String bio = '';

  @override
  Widget build(BuildContext context) {
    context
        .read<TemporaryData>()
        .retrieveData(FirebaseAuth.instance.currentUser!.uid);
    context.read<TemporaryData>().follows(widget.uid);
    followsname = '${context.watch<TemporaryData>().followsname}';

    followsprofilepic = '${context.watch<TemporaryData>().followsprofilepic}';
    followsbio = '${context.watch<TemporaryData>().followsbio}';

    name = context.watch<TemporaryData>().accountName;
    profilepic = context.watch<TemporaryData>().profilepic;
    bio = context.watch<TemporaryData>().bio;

    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: <Widget>[
              (context.watch<TemporaryData>().followsuid == null)
                  ? GestureDetector(
                      onTap: () => {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("following")
                                .doc(widget.uid)
                                .set({
                              "uid": widget.uid,
                              "name": followsname,
                              "profilepic": followsprofilepic,
                              "bio": followsbio,
                              "following": true,
                              "docid": myDoc.id,
                            }),
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(widget.uid)
                                .collection("followers")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .set({
                              "uid": FirebaseAuth.instance.currentUser!.uid,
                              "name": name,
                              "profilepic": profilepic,
                              "bio": bio,
                            }),
                          },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                    color: const Color.fromARGB(255, 37, 39, 61)
                                        .withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(-5, -5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:
                                  (context.watch<TemporaryData>().followsuid ==
                                          null)
                                      ? const Text(
                                          'Follow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const Text(
                                          'Unfollow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                            )),
                      )
                      // child: Icon(Icons.star),
                      )
                  : GestureDetector(
                      onTap: () => {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("following")
                                .doc(widget.uid)
                                .delete(),
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(widget.uid)
                                .collection("followers")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .delete(),
                          },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                    color: const Color.fromARGB(255, 37, 39, 61)
                                        .withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(-5, -5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:
                                  (context.watch<TemporaryData>().followsuid ==
                                          null)
                                      ? const Text(
                                          'Follow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const Text(
                                          'Unfollow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                            )),
                      )
                      // child: Icon(Icons.star),
                      ),
            ], //<Widget>[]
            backgroundColor: const Color(0xff181A28),
            elevation: 0,
            // elevation: 50.0,
            // leadingWidth: MediaQuery.of(context).size.width,
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('${context.watch<TemporaryData>().followsname}'),
            ),
          ),
          backgroundColor: const Color(0xff181A28),
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 220,
                  toolbarHeight: 200,
                  title: _profile(),
                  // flexibleSpace: FlexibleSpaceBar(background: _profile()),
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
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                _rants(),
              ],
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
                          '${context.watch<TemporaryData>().followsprofilepic}',
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
                    '${context.watch<TemporaryData>().followsname}',
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
          stream: ref.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.docs.length != 0) {
                //  } else {
                //   return Center(
                //       child: Text(
                //     "You haven't ranted yet.",
                //     style: TextStyle(color: Colors.white),
                //   ));
                // }
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
                                                    offset:
                                                        const Offset(-5, -5)),
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
                                              followsprofilepic,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        followsname,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: GestureDetector(
                                          // onTap: () => {print('Favourite')},
                                          child: LikeButton(
                                            // likeCount: 120,
                                            animationDuration:
                                                const Duration(seconds: 1),
                                            bubblesColor: const BubblesColor(
                                                dotPrimaryColor: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                dotSecondaryColor:
                                                    Color.fromARGB(
                                                        255, 251, 8, 134),
                                                dotThirdColor: Color.fromARGB(
                                                    255, 251, 8, 134),
                                                dotLastColor: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            likeBuilder: (isTapped) {
                                              return Icon(
                                                CupertinoIcons.heart_fill,
                                                color: isTapped
                                                    ? Colors.pink
                                                    : Colors.white,
                                              );
                                            },
                                            // countPostion: CountPostion.bottom,
                                          ),
                                          // child: Icon(Icons.star),
                                        ),
                                      ),
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
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Colors.black),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 20.0),
                                                        child: Container(
                                                          height: 4,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.grey,
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
                                                              color: Colors
                                                                  .white70),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
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
                                                              color: Colors
                                                                  .white70),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
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
                return Center(
                    child: Text(
                  "${context.watch<TemporaryData>().followsname} hasn't ranted yet.",
                  style: const TextStyle(color: Colors.white),
                ));
              }
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
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
}
