import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rant_app/searched_user.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String name = '';
  String uid = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 80,
            backgroundColor: const Color(0xff181A28),
            title: const Padding(
                padding: EdgeInsets.all(10), child: Text('Explore')),
          ),
          backgroundColor: const Color(0xff181A28),
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: 100,
                  title: _profile(),
                  expandedHeight: 50,
                  backgroundColor: const Color(0xff181A28),
                  pinned: true,
                  elevation: 0,
                  floating: true,
                ),
              ];
            },
            body: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;

                          if (name!.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () => {
                                  uid = data['uid'],
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchedUser(uid: uid)))
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff181A28),
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
                                  child: ListTile(
                                    title: Text(
                                      data['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      data['bio'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff181A28),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
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
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(data['profilepic']),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          if (data['name']
                              .toString()
                              .toLowerCase()
                              .startsWith(name!.toLowerCase())) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () => {
                                  uid = data['uid'],
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchedUser(uid: uid)))
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff181A28),
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
                                  child: ListTile(
                                    title: Text(
                                      data['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      data['bio'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(data['profilepic']),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        });
              },
            ),
          )),
    );
  }

  _profile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff181A28),
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
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                decoration: InputDecoration(
                  counterText: '',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  hintText: 'Search',
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
            Icon(CupertinoIcons.search)
          ],
        ),
      ),
    );
  }
}
