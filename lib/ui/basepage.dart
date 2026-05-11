// import 'package:discoverlanka/theme.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Waves
          Opacity(
            opacity: 0.6,
            child: ClipPath(
              clipper: TopWaveClipper(),
              child: Container(
                color: const Color.fromARGB(
                  255,
                  88,
                  211,
                  141,
                ), // More vibrant green-mint
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: ClipPath(
              clipper: TopWaveClipper(),
              child: Container(
                color: const Color.fromARGB(
                  255,
                  65,
                  199,
                  118,
                ), // Richer green with more saturation
                height: MediaQuery.of(context).size.height * 0.37,
              ),
            ),
          ),
          ClipPath(
            clipper: TopWaveClipper(),
            child: Container(
              color: const Color.fromARGB(
                255,
                45,
                163,
                94,
              ), // More saturated forest green
              height: MediaQuery.of(context).size.height * 0.34,
            ),
          ),
          // Bottom Waves
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: ClipPath(
                    clipper: BottomWaveClipper(),
                    child: Container(
                      color: const Color.fromARGB(
                        255,
                        88,
                        211,
                        141,
                      ), // More vibrant green-mint
                      height: MediaQuery.of(context).size.height * 0.22,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.8,
                  child: ClipPath(
                    clipper: BottomWaveClipper(),
                    child: Container(
                      color: const Color.fromARGB(
                        255,
                        65,
                        199,
                        118,
                      ), // More vibrant green-mint
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    color: const Color.fromARGB(
                      255,
                      45,
                      163,
                      94,
                    ), // More vibrant green-mint
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Logo.png', height: 100, width: 100),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        'Discover Lanka',
                        style: GoogleFonts.figtree(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                Image.asset('assets/luggage.png', width: 200, height: 200),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => Loginpage(),
                      ),
                    );
                  },
                  label: Text('Get Start'),
                  icon: Icon(Icons.arrow_forward_outlined),
                  iconAlignment: IconAlignment.end,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 117, 49),
                    foregroundColor: Colors.white,
                    iconSize: 40,
                    iconAlignment: IconAlignment.end,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.toString());

    // First Wave
    var path = Path();
    path.lineTo(0, size.height); // start from bottom left
    var firstControlPoint = Offset(size.width * 0.1, size.height);
    var firstEndPoint = Offset(size.width * 0.3, size.height * 0.9);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    // Second Wave
    var secondControlPoint = Offset(size.width * 0.8, size.height * 0.65);
    var secondEndPoint = Offset(size.width, size.height * 0.95);
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

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.toString());

    var path = Path();

    // Start from top left
    path.lineTo(0, size.height * 0.5);

    // First Wave (inverted)
    var firstControlPoint = Offset(size.width * 0.1, size.height * 0.5);
    var firstEndPoint = Offset(size.width * 0.3, size.height * 0.4);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    // Second Wave (inverted)
    var secondControlPoint = Offset(size.width * 0.8, size.height * 0.15);
    var secondEndPoint = Offset(size.width, size.height * 0.5);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    // Complete the shape
    path.lineTo(size.width, size.height); // bottom right
    path.lineTo(0, size.height); // bottom left
    path.close(); // close the path to form a shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return true if you want to reclip when something changes
  }
}
