import 'package:flutter/material.dart';
import 'package:rant_app/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String? name = '';
  String? uid = '';
  // String theme = '';
  // String rants = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-psd/3d-illustration-man-with-binoculars-top-cloud-topped-mountain_1150-53639.jpg?w=996&t=st=1672343811~exp=1672344411~hmac=94fae20c7049de1618359fc11e5d07e73dd2d22296b78ea16725d75d9e8b45a2',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 125.0, left: 50),
              child: Text(
                "The Best place\nyou can\nrant",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            GestureDetector(
              // onTap: () => Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             const MyNavigationBar()),
              //     (route) => false),

              onTap: () => {
                AuthService().signInWithGoogle(),
                // name = FirebaseAuth.instance.currentUser!.displayName,
                // uid = FirebaseAuth.instance.currentUser!.uid,
                // print('boomeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'),
                // if (FirebaseAuth.instance.currentUser!.displayName != 'null')
                //   {
                //     // Map <String, dynamic> data = {
                //     //     "uid":uid,
                //     //     "name": name
                //     //   },
                //     FirebaseFirestore.instance
                //         .collection("users")
                //         .doc(uid)
                //         .set({"uid": uid, "name": name})
                //   }
              },
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 12, top: 12, bottom: 12),
                      child: Row(
                        children: [
                          Center(
                            child: SizedBox(
                                height: 30,
                                child: Image.asset(
                                    'assets/images/google-logo.png')),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              ' Sign in with Google ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
