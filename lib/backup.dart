// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   String? _tempimageurl;
//   String? _tempname;
//   String? _subdoc;
//   String? _myrant;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       // resizeToAvoidBottomInset: false,
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 150.0, bottom: 50),
//             child: Text(
//               'T E M P L A T E S',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 fontFamily: 'AltonaSans-Regular',
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 8.0, right: 11),
//             child: SizedBox(
//               height: 32,
//               width: 320,
//               child: Text(
//                 'Image URL',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontFamily: 'AltonaSans-Regular',
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 30,
//               bottom: 20,
//               right: 30,
//             ),
//             child: TextField(
//               autofocus: false,
//               cursorColor: const Color(0xFF21BFBD),
//               onChanged: (value) {
//                 _tempimageurl = value;
//               },
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF21BFBD))),
//                   focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF21BFBD))),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(right: 11),
//             child: SizedBox(
//               height: 32,
//               width: 320,
//               child: Text(
//                 'Cover Pic Name',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontFamily: 'AltonaSans-Regular',
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 30,
//               bottom: 20,
//               right: 30,
//             ),
//             child: TextField(
//               autofocus: false,
//               cursorColor: const Color(0xFF21BFBD),
//               onChanged: (tempname) {
//                 _tempname = tempname;
//               },
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF21BFBD))),
//                   focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF21BFBD))),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(right: 11),
//             child: SizedBox(
//               height: 32,
//               width: 320,
//               child: Text(
//                 'Rant',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontSize: 28,
//                   color: Colors.white,
//                   fontFamily: 'AltonaSans-Regular',
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 30,
//               bottom: 40,
//               right: 30,
//             ),
//             child: TextField(
//               autofocus: false,
//               cursorColor: const Color(0xFF21BFBD),
//               onChanged: (myrant) {
//                 _myrant = myrant;
//               },
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF21BFBD))),
//                   focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF21BFBD))),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: SizedBox(
//               height: 50,
//               width: 330,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   foregroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(const Color(0xFF21BFBD)),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   Map<String, dynamic> dataaaa = {
//                     "rant": _myrant,
//                   };
//                   DocumentReference myDoc = FirebaseFirestore.instance
//                       .collection("users")
//                       .doc(FirebaseAuth.instance.currentUser!.uid)
//                       .collection("rants")
//                       .doc();
//                   FirebaseFirestore.instance
//                       .collection("users")
//                       .doc(FirebaseAuth.instance.currentUser!.uid)
//                       .collection("rants")
//                       .doc()
//                       .set({"rant": _myrant, "rantid": myDoc.id});
//                 },
//                 child: const Text('R A N T'),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: SizedBox(
//               height: 50,
//               width: 330,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   foregroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.orange),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (_tempimageurl != '' && _tempname != '' && _subdoc == '') {
//                     Map<String, dynamic> data = {
//                       "imageurl": _tempimageurl,
//                       "name": _tempname
//                     };
//                     FirebaseFirestore.instance
//                         .collection("template")
//                         .doc(_tempname)
//                         .update({"imageurl": _tempimageurl, "name": _tempname});
//                     return print("$_tempname Cover Pic Updated");
//                   } else if (_tempimageurl != '' &&
//                       _tempname != '' &&
//                       _subdoc != '') {
//                     FirebaseFirestore.instance
//                         .collection("template")
//                         .doc(_tempname)
//                         .collection("templates")
//                         .doc(_subdoc)
//                         .update({"imageurl": _tempimageurl, "name": _subdoc});
//                     return print("$_tempname $_subdoc Template Updated");
//                   } else {
//                     return print("Provide some credentials");
//                   }
//                 },
//                 child: const Text('U   P   D   A   T   E'),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//             width: 330,
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 if (_tempimageurl != '' && _tempname != '' && _subdoc == '') {
//                   Map<String, dynamic> data = {
//                     "imageurl": _tempimageurl,
//                     "name": _tempname
//                   };
//                   FirebaseFirestore.instance
//                       .collection("template")
//                       .doc(_tempname)
//                       .delete();
//                   return print("$_tempname Cover Pic Deleted");
//                 } else if (_tempimageurl != '' &&
//                     _tempname != '' &&
//                     _subdoc != '') {
//                   FirebaseFirestore.instance
//                       .collection("template")
//                       .doc(_tempname)
//                       .collection("templates")
//                       .doc(_subdoc)
//                       .delete();
//                   return print("$_tempname $_subdoc Template Deleted");
//                 } else {
//                   return print("Provide some credentials");
//                 }
//               },
//               child: const Text('D   E   L   E   T   E'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
