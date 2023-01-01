// import 'dart:math';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';
// import 'package:provider/provider.dart';
// import 'package:rant_app/auth_service.dart';

// import 'Provider/theme.dart';
// import 'editprofile.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             toolbarHeight: 80,
//             actions: <Widget>[
//               IconButton(
//                 icon: const Icon(CupertinoIcons.arrow_2_circlepath),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => const EditProfile(),
//                       ));
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(CupertinoIcons.back),
//                 onPressed: () {
//                   AuthService().signOut();
//                 },
//               ),
//             ], //<Widget>[]
//             backgroundColor: Colors.black,
//             // elevation: 50.0,
//             // leadingWidth: MediaQuery.of(context).size.width,
//             title: const Padding(
//               padding: EdgeInsets.all(10),
//               child: Text('Settings'),
//             ),
//             // bottom: TabBar(
//             //   tabs: [
//             //     Tab(
//             //       child: Icon(Icons.dangerous),
//             //     )
//             //   ],
//             // ),
//           ),
//           backgroundColor: Colors.black,
//           body: NestedScrollView(
//             physics: BouncingScrollPhysics(),
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 new SliverAppBar(
//                   expandedHeight: 200,
//                   flexibleSpace: FlexibleSpaceBar(background: _profile()),
//                   backgroundColor: Colors.black,
//                   pinned: true,
//                   floating: true,
//                   bottom: TabBar(
//                     physics: BouncingScrollPhysics(),
//                     indicatorSize: TabBarIndicatorSize.label,
//                     isScrollable: true,
//                     tabs: [
//                       Tab(
//                         text: 'Rants',
//                       ),
//                       Tab(
//                         text: 'Following',
//                       ),
//                       Tab(
//                         text: 'Followers',
//                       )
//                     ],
//                   ),
//                 ),
//               ];
//             },
//             body: TabBarView(
//               children: <Widget>[_rants(), _following(), _followers()],
//             ),
//           )),
//     );
//   }

//   _profile() {
//     return Padding(
//       padding: EdgeInsets.only(top: 5),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30)),
//                       clipBehavior: Clip.antiAlias,
//                       child: Image.network(
//                           FirebaseAuth.instance.currentUser!.photoURL!),
//                     ),
//                   ),
//                 ],
//               ),
//               // Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     FirebaseAuth.instance.currentUser!.displayName!,
//                     style: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                   const Text(
//                     'Bio',
//                     style: TextStyle(
//                         color: Colors.white, fontStyle: FontStyle.italic),
//                   ),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   _bar() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.grey,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Row(children: [
//           GestureDetector(
//             onTap: () => {context.read<TemporaryData>().rant()},
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: (context.watch<TemporaryData>().index == 0)
//                     ? Colors.grey.shade300
//                     : Colors.transparent,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Rants',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () => {context.read<TemporaryData>().following()},
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: (context.watch<TemporaryData>().index == 1)
//                     ? Colors.grey.shade300
//                     : Colors.transparent,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Following',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () => {context.read<TemporaryData>().followers()},
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: (context.watch<TemporaryData>().index == 2)
//                     ? Colors.grey.shade300
//                     : Colors.transparent,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Followers',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }

//   _rants() {
//     return Column(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           margin: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.grey,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 5.0, bottom: 25, right: 10, left: 10),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 10.0,
//                     right: 10,
//                     top: 15,
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10.0),
//                         child: SizedBox(
//                           height: 40,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30)),
//                             clipBehavior: Clip.antiAlias,
//                             child: Image.network(
//                                 FirebaseAuth.instance.currentUser!.photoURL!),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         FirebaseAuth.instance.currentUser!.displayName!,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 20.0),
//                         child: GestureDetector(
//                           // onTap: () => {print('Favourite')},
//                           child: LikeButton(
//                             // likeCount: 120,
//                             animationDuration: const Duration(seconds: 1),
//                             bubblesColor: const BubblesColor(
//                                 dotPrimaryColor:
//                                     Color.fromARGB(255, 255, 255, 255),
//                                 dotSecondaryColor:
//                                     Color.fromARGB(255, 251, 8, 134),
//                                 dotThirdColor: Color.fromARGB(255, 251, 8, 134),
//                                 dotLastColor:
//                                     Color.fromARGB(255, 255, 255, 255)),
//                             likeBuilder: (isTapped) {
//                               return Icon(
//                                 CupertinoIcons.heart_fill,
//                                 color: !isTapped ? Colors.pink : Colors.black,
//                               );
//                             },
//                             // countPostion: CountPostion.bottom,
//                           ),
//                           // child: Icon(Icons.star),
//                         ),
//                       ),
//                       GestureDetector(
//                         // onTap: () => {print('Pop-up')},
//                         child: SizedBox(
//                             height: 20,
//                             child: Image.asset('assets/images/dots.png')),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                         padding: EdgeInsets.only(
//                             left: 15, top: 20, right: 10, bottom: 10),
//                         child: Text('Type something you would like to rant.')),
//                     Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15.0,
//                           right: 15,
//                         ),
//                         child: image()),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   image() {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       clipBehavior: Clip.antiAlias,
//       child: Image.network(url),
//     );
//   }

//   String url = 'https://wallpapercave.com/dwp1x/wp5756429.jpg';

//   _following() {
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Center(
//               child: Text(
//                 'Following',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _followers() {
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Center(
//               child: Text(
//                 'Followers',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
