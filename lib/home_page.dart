import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rant_app/Provider/theme.dart';
import 'package:rant_app/new_rant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewRant()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              context.read<TemporaryData>().changeTheme();
            },
          ),
        ], //<Widget>[]
        backgroundColor: Colors.black,
        // elevation: 50.0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: const AssetImage(
                    'assets/images/logo.png',
                  ),
                  invertColors:
                      context.watch<TemporaryData>().theme ? true : false,
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
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
            // boxShadow: const [
            //   BoxShadow(
            //       color: Color.fromARGB(20, 0, 0, 0),
            //       blurRadius: 5,
            //       offset: Offset(10, 10)),
            //   BoxShadow(
            //       color: Colors.white, blurRadius: 5, offset: Offset(-10, -10)),
            // ],
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                                dotThirdColor: Color.fromARGB(255, 251, 8, 134),
                                dotLastColor:
                                    Color.fromARGB(255, 255, 255, 255)),
                            likeBuilder: (isTapped) {
                              return Icon(
                                CupertinoIcons.heart_fill,
                                color: isTapped ? Colors.pink : Colors.black,
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
                      child: Text('Your rant comes here'),
                    ),
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

const String url = 'https://wallpapercave.com/dwp1x/wp5756429.jpg';
