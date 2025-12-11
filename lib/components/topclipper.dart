import 'package:flutter/material.dart';

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
