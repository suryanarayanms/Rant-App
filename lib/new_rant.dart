import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRant extends StatefulWidget {
  const NewRant({Key? key}) : super(key: key);
  @override
  State<NewRant> createState() => NewRantState();
}

class NewRantState extends State<NewRant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.podcasts_outlined),
            onPressed: () {},
          ),
        ], //<Widget>[]
        backgroundColor: Colors.black,
        // elevation: 50.0,
        leadingWidth: 80,
        // leadingWidth: MediaQuery.of(context).size.width,
        // leading: GestureDetector(
        //   onTap: (() => Navigator.pop(context)),
        //   child: Icon(
        //     CupertinoIcons.delete,
        //   ),
        // ),
        title: const Padding(padding: EdgeInsets.all(10), child: Text('Rant')),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(children: [_context(), gallery()])),
      ),
    );
  }

  _context() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15, top: 20, right: 10, bottom: 10),
                      child: Text(
                        'Type something you would like to rant',
                      ),
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.antiAlias,
        child: Image.network(url),
      ),
    );
  }

  gallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(url),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.photo),
                    Spacer(),
                    Icon(CupertinoIcons.delete)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

const String url =
    'https://th.bing.com/th/id/OIP.D7E68k2v1S5tdBs-nZx7zAHaEK?pid=ImgDet&w=1367&h=769&rs=1';
