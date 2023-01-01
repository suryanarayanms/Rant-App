import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);
  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        //<Widget>[]
        backgroundColor: Colors.black,
        // elevation: 50.0,
        // leadingWidth: MediaQuery.of(context).size.width,
        title: const Padding(
            padding: EdgeInsets.all(10), child: Text('Favourites')),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              _context(),
              _context(),
              _context(),

// Rant Box ENDING
            ],
          ),
        ),
      ),
    );
  }

  _context() {
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
                        child: image()
                        // child: Container(
                        //     decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(20),
                        //   image: const DecorationImage(
                        //       image: NetworkImage(
                        //           'https://wallpapercave.com/dwp1x/wp6045534.jpg'),
                        //       fit: BoxFit.cover),
                        // )),
                        // child: Image.asset('assets/images/home.png', scale: 3.0),
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(url),
    );
  }
}

const String url =
    'https://firebasestorage.googleapis.com/v0/b/rant-me.appspot.com/o/rantImages%2F1672594327592.jpg?alt=media&token=e1e08343-0216-4612-ba00-fb1ac3107726';
