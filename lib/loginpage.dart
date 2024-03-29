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
            Padding(
              padding: const EdgeInsets.only(top: 200.0, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Welcome to Rant !",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    "Rant what's on your mind.\nNever get bored.",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
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
                // context.read<TemporaryData>().retrieveData(context),
                AuthService().signInWithGoogle(),
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
                                fontWeight: FontWeight.bold,
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
