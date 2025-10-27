import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      94,
                      122,
                      90,
                    ).withValues(alpha: 100),
                    spreadRadius: 12,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(color: Colors.green[800]),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: const Color.fromARGB(255, 20, 73, 41),),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.toString());

    // First Wave
    var path = Path();
    path.lineTo(0, size.height); // start from bottom left
    var firstControlPoint = Offset(0, size.height * 0.85);
    var firstEndPoint = Offset(size.width * 0.1, size.height * 0.85);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var firstStraightPoint = Offset(0, size.height * 0.85);
    var secondStrightPoint = Offset(size.width * 0.9, size.height * 0.85);

    path.quadraticBezierTo(
      firstStraightPoint.dx,
      firstStraightPoint.dy,
      secondStrightPoint.dx,
      secondStrightPoint.dy,
    );
    // Second Wave
    var secondControlPoint = Offset(size.width, size.height * 0.85);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0); // top right
    path.close(); // close the path to form a shape
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return true if you want to reclip when something changes
  }
}
