import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:rant_app/auth_service.dart';
import 'package:rant_app/userprofile.dart';

import 'editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            backgroundColor: Color(0xff181A28),
            elevation: 0,
            // elevation: 50.0,
            // leadingWidth: MediaQuery.of(context).size.width,
            title: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Settings'),
            ),
            // bottom: TabBar(
            //   tabs: [
            //     Tab(
            //       child: Icon(Icons.dangerous),
            //     )
            //   ],
            // ),
          ),
          backgroundColor: Color(0xff181A28),
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(background: _profile()),
                  backgroundColor: Color(0xff181A28),
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
                        text: 'Following',
                      ),
                      Tab(
                        text: 'Followers',
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
    );
  }

  _rants() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff181A28),
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
                        GestureDetector(
                            onTap: () => {},
                            child: Text(
                              FirebaseAuth.instance.currentUser!.displayName!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            // onTap: () => {print('Favourite')},
                            child: LikeButton(
                              // likeCount: 120,
                              animationDuration: const Duration(seconds: 1),
                              bubblesColor: const BubblesColor(
                                  dotPrimaryColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  dotSecondaryColor:
                                      Color.fromARGB(255, 251, 8, 134),
                                  dotThirdColor:
                                      Color.fromARGB(255, 251, 8, 134),
                                  dotLastColor:
                                      Color.fromARGB(255, 255, 255, 255)),
                              likeBuilder: (isTapped) {
                                return Icon(
                                  CupertinoIcons.heart_fill,
                                  color: isTapped ? Colors.white : Colors.pink,
                                );
                              },
                              // countPostion: CountPostion.bottom,
                            ),
                            // child: Icon(Icons.star),
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => {print('Pop-up')},
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
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 15, top: 20, right: 10, bottom: 10),
                        child: Text(
                          'Your rant comes here',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15,
                          ),
                          child: image()),
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(url),
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
                            height: 40,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserProfile()))
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(FirebaseAuth
                                    .instance.currentUser!.photoURL!),
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
                                    color: Color(0xff181A28),
                                    borderRadius: BorderRadius.circular(10),
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
                            height: 40,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserProfile()))
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(FirebaseAuth
                                    .instance.currentUser!.photoURL!),
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
                                    color: Color(0xff181A28),
                                    borderRadius: BorderRadius.circular(10),
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
