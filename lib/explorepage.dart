import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 80,
            backgroundColor: Color(0xff181A28),
            title: const Padding(
                padding: EdgeInsets.all(10), child: Text('Explore')),
          ),
          backgroundColor: Color(0xff181A28),
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: _profile(),
                  expandedHeight: 70,
                  backgroundColor: Color(0xff181A28),
                  pinned: true,
                  elevation: 0,
                  floating: true,
                ),
              ];
            },
            body: const TabBarView(
              children: <Widget>[
                Tab(
                  child: Text(
                    'Will decide later',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }

  _profile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
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
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: const [
                Text(
                  'Search',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Spacer(),
                Icon(CupertinoIcons.search)
              ],
            ),
          )),
    );
  }
}
