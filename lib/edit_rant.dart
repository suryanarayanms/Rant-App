import 'package:flutter/material.dart';
import 'package:rant_app/navbar.dart';

class EditRant extends StatefulWidget {
  const EditRant({Key? key}) : super(key: key);

  @override
  State<EditRant> createState() => EditRantState();
}

class EditRantState extends State<EditRant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => {Navigator.pop(context)},
                    child: const SizedBox(
                      height: 27,
                    ),
                  ),
                  SizedBox(
                      height: 70,
                      child: Image.asset('assets/images/rant_logo.png')),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey.shade100,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0),
                        blurRadius: 5,
                        offset: Offset(7, 7)),
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(-7, -7)),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('Enter your cringe name...'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade100,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(20, 0, 0, 0),
                            blurRadius: 5,
                            offset: Offset(7, 7)),
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            offset: Offset(-7, -7)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          height: 40,
                          child: Image.asset('assets/images/gallery.png')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade100,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              blurRadius: 5,
                              offset: Offset(7, 7)),
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 5,
                              offset: Offset(-7, -7)),
                        ],
                      ),
                      child: const Center(child: Text('Insert image')),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, bottom: 20, left: 30, right: 30),
              child: GestureDetector(
                // onTap: (() => print('Gallery')),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade100,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(20, 0, 0, 0),
                          blurRadius: 5,
                          offset: Offset(7, 7)),
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 5,
                          offset: Offset(-7, -7)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                        height: 150,
                        child: Image.asset('assets/images/gallery.png')),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: (() => {Navigator.pop(context)}),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 40,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade100,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              blurRadius: 5,
                              offset: Offset(7, 7)),
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 5,
                              offset: Offset(-7, -7)),
                        ],
                      ),
                      child: const Center(child: Text('Discard')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: (() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MyNavigationBar(),
                          ),
                          (route) => false,
                        )),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 40,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade100,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              blurRadius: 5,
                              offset: Offset(7, 7)),
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 5,
                              offset: Offset(-7, -7)),
                        ],
                      ),
                      child: const Center(
                        child: SizedBox(
                            // height: ,
                            child: Text('Save')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}