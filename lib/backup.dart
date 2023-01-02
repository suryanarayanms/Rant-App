// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// // import 'firebase_options.dart';

// class SearchDemo extends StatefulWidget {
//   const SearchDemo({Key? key}) : super(key: key);

//   @override
//   State<SearchDemo> createState() => _SearchDemoState();
// }

// class _SearchDemoState extends State<SearchDemo> {
//   String name = '';
//   List<Map<String, dynamic>> data = [
//     {
//       'name': 'John',
//       'profilepic':
//           'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
//       'bio': 'john@gmail.com'
//     },
//     {
//       'name': 'Eric',
//       'profilepic':
//           'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
//       'bio': 'eric@gmail.com'
//     },
//     {
//       'name': 'Mark',
//       'profilepic':
//           'https://i.picsum.photos/id/449/200/300.jpg?grayscale&hmac=GcAk7XLOGeBrqzrEpBjAzBcZFJ9bvyMwvL1QENQ23Zc',
//       'bio': 'mark@gmail.com'
//     },
//     {
//       'name': 'Ela',
//       'profilepic':
//           'https://i.picsum.photos/id/3/200/300.jpg?blur=2&hmac=CgtEzNwC4BLEa1z5r0oGOsZPj5wJlqjU615MLuFillY',
//       'bio': 'ela@gmail.com'
//     },
//     {
//       'name': 'Sue',
//       'profilepic':
//           'https://i.picsum.photos/id/497/200/300.jpg?hmac=IqTAOsl408FW-5QME1woScOoZJvq246UqZGGR9UkkkY',
//       'bio': 'sue@gmail.com'
//     },
//     {
//       'name': 'Lothe',
//       'profilepic':
//           'https://i.picsum.photos/id/450/200/300.jpg?hmac=EAnz3Z3i5qXfaz54l0aegp_-5oN4HTwiZG828ZGD7GM',
//       'bio': 'lothe@gmail.com'
//     },
//     {
//       'name': 'Alyssa',
//       'profilepic':
//           'https://i.picsum.photos/id/169/200/200.jpg?hmac=MquoCIcsCP_IxfteFmd8LfVF7NCoRre282nO9gVD0Yc',
//       'bio': 'Alyssa@gmail.com'
//     },
//     {
//       'name': 'Nichols',
//       'profilepic':
//           'https://i.picsum.photos/id/921/200/200.jpg?hmac=6pwJUhec4NqIAFxrha-8WXGa8yI1pJXKEYCWMSHroSU',
//       'bio': 'Nichols@gmail.com'
//     },
//     {
//       'name': 'Welch',
//       'profilepic':
//           'https://i.picsum.photos/id/845/200/200.jpg?hmac=KMGSD70gM0xozvpzPM3kHIwwA2TRlVQ6d2dLW_b1vDQ',
//       'bio': 'Welch@gmail.com'
//     },
//     {
//       'name': 'Delacruz',
//       'profilepic':
//           'https://i.picsum.photos/id/250/200/200.jpg?hmac=23TaEG1txY5qYZ70amm2sUf0GYKo4v7yIbN9ooyqWzs',
//       'bio': 'Delacruz@gmail.com'
//     },
//     {
//       'name': 'Tania',
//       'profilepic':
//           'https://i.picsum.photos/id/237/200/200.jpg?hmac=zHUGikXUDyLCCmvyww1izLK3R3k8oRYBRiTizZEdyfI',
//       'bio': 'Tania@gmail.com'
//     },
//     {
//       'name': 'Jeanie',
//       'profilepic':
//           'https://i.picsum.photos/id/769/200/200.jpg?hmac=M55kAfuYOrcJ8a49hBRDhWtVLbJo88Y76kUz323SqLU',
//       'bio': 'Jeanie@gmail.com'
//     }
//   ];

//   addData() async {
//     for (var element in data) {
//       FirebaseFirestore.instance.collection('users').add(element);
//     }
//     print('all data added');
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     addData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Card(
//         child: TextField(
//           decoration: InputDecoration(
//               prefixIcon: Icon(Icons.search), hintText: 'Search...'),
//           onChanged: (val) {
//             setState(() {
//               name = val;
//             });
//           },
//         ),
//       )),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshots) {
//           return (snapshots.connectionState == ConnectionState.waiting)
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   itemCount: snapshots.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     var data = snapshots.data!.docs[index].data()
//                         as Map<String, dynamic>;

//                     if (name!.isEmpty) {
//                       return ListTile(
//                         title: Text(
//                           data['name'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           data['email'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(data['profilepic']),
//                         ),
//                       );
//                     } else {
//                       print('object');
//                     }
//                     if (data['name']
//                         .toString()
//                         .toLowerCase()
//                         .startsWith(name!.toLowerCase())) {
//                       return ListTile(
//                         title: Text(
//                           data['name'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           data['email'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(data['profilepic']),
//                         ),
//                       );
//                     }
//                     return Container();
//                   });
//         },
//       ),
//     );
//   }
// }
