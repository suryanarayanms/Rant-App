import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.dark_mode),
        //     onPressed: () {},
        //   ),
        // ], //<Widget>[]
        backgroundColor: Colors.black,
        // elevation: 50.0,
        // leadingWidth: MediaQuery.of(context).size.width,
        title:
            const Padding(padding: EdgeInsets.all(10), child: Text('Explore')),
      ),
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
