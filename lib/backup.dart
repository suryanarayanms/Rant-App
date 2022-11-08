// import 'package:flutter/material.dart';
// import 'package:rant_app/home_page.dart';
// import 'package:rant_app/theme.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ThemeBuilder(
//       builder: (context, _brightness, _bool) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Rant',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             brightness: _brightness,
//           ),
//           home: const LoginPage(),
//         );
//       },
//       defaultBrightness: Brightness.light,
//       defaultBool: true,
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 200.0),
//           child: SizedBox(
//               height: 150,
//               width: 150,
//               child: Image.asset('assets/images/rant_logo.png')),
//         ),
//         Row(
//           children: const [
//             Padding(
//               padding: EdgeInsets.only(top: 100, left: 35.0, bottom: 25),
//               child: Text(
//                 ' Sign in ',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 19,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         GestureDetector(
//           onTap: () => Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => const HomePage()),
//               (route) => false),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 30.0, right: 30),
//             child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(9),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 1,
//                     )),
//                 // color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     children: [
//                       Center(
//                         child: SizedBox(
//                             height: 40,
//                             child:
//                                 Image.asset('assets/images/google-logo.png')),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 30.0),
//                         child: Text(
//                           ' Sign in with Google ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 19,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//         ),
//       ],
//     ));
//   }
// }
