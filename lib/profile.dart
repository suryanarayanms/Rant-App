import 'package:flutter/material.dart';
import 'package:rant_app/navbar.dart';

class Profile extends StatefulWidget {
  Profile(this.value, {key});
  late bool value;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return widget.value
        ? Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: SizedBox(
                              height: 27,
                              child: Image.asset('assets/images/home.png')),
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
                    padding: const EdgeInsets.only(top: 60.0, bottom: 35),
                    child: GestureDetector(
                      // onTap: (() => print('Gallery')),
                      child: Container(
                        width: 200,
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
                  const SizedBox(
                    height: 50,
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
                        child: const Center(child: Text('Save')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.blue,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: SizedBox(
                              height: 27,
                              child: Image.asset('assets/images/home.png')),
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
                    padding: const EdgeInsets.only(top: 60.0, bottom: 35),
                    child: GestureDetector(
                      // onTap: (() => print('Gallery')),
                      child: Container(
                        width: 200,
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
                  const SizedBox(
                    height: 50,
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
                        child: const Center(child: Text('Save')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
