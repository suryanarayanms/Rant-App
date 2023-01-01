import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: 80,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Unfollow',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // IconButton(
          //   icon: const Icon(CupertinoIcons.wand_stars_inverse),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ], //<Widget>[]
        backgroundColor: Colors.black,
        // elevation: 50.0,
        // leadingWidth: MediaQuery.of(context).size.width,
        title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(FirebaseAuth.instance.currentUser!.displayName!)),
      ),
      backgroundColor: Colors.black,
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
            ),
            _rants(),
            _rants(),
            _rants(),
            _rants()
          ],
        ),
      ),
    );
  }

  _rants() {
    return Column(
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
                      Text(
                        FirebaseAuth.instance.currentUser!.displayName!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                                dotThirdColor: Color.fromARGB(255, 251, 8, 134),
                                dotLastColor:
                                    Color.fromARGB(255, 255, 255, 255)),
                            likeBuilder: (isTapped) {
                              return Icon(
                                CupertinoIcons.heart_fill,
                                color: !isTapped ? Colors.pink : Colors.black,
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
                            child: Image.asset('assets/images/dots.png')),
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
                        child: Text('Type something you would like to rant.')),
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
}
