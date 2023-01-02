import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewImage extends StatefulWidget {
  final String image;
  const ViewImage({Key? key, required this.image}) : super(key: key);

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: const Color(0xff181A28),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff181A28),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(5, 5)),
                  BoxShadow(
                      color: const Color.fromARGB(255, 37, 39, 61)
                          .withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(-5, -5)),
                ],
                color: const Color(0xff181A28)),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: Image.network('${widget.image}'),
            ),
          ),
        ),
      ),
    );
  }
}
