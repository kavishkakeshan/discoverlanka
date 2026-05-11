import 'package:discoverlanka/components/customInputField.dart';
import 'package:discoverlanka/components/topclipper.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/dashboard.dart';
import 'package:discoverlanka/ui/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final authService = AuthService();
  bool passwordVisible = true;
  bool _showText = true;
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!_formKey.currentState!.saveAndValidate()) {
      setState(() => _showText = true);
      return;
    }
    setState(() => _showText = false);
    try {
      // 👇 Add await — without this it navigates before auth completes
      final response = await authService.signInWithEmailPassword(
        email,
        password,
      );

      if (!mounted) return;

      if (response.user != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login successful')));
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => Dashboard()),
        );
      }
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: ${error.message}'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      129,
                      150,
                      125,
                    ).withValues(alpha: 100),
                    spreadRadius: 8,
                    blurRadius: 8,
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
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(flex: 2),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Icon(Icons.login_rounded, size: 50),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  // Email Input Field
                  CustomInputField(
                    name: 'email',
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Email is required',
                      ),
                      FormBuilderValidators.email(
                        errorText: 'Please enter a valid email address',
                      ),
                    ]),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  // Password Input Field
                  CustomInputField(
                    name: 'password',
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    obscureText: passwordVisible,
                    controller: passwordController,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Password is required',
                      ),
                    ]),
                    onVisibilityToggle: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      ' Forgot Password ? ',
                      style: TextStyle(
                        color: Colors.green[900],
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green[900],
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      login();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 79, 182, 83),
                            const Color.fromARGB(255, 113, 243, 109),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: AnimatedSwitcher(
                        duration: Duration(microseconds: 500),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: _showText
                            ? Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                                key: ValueKey('text'),
                              )
                            : Icon(
                                Icons.check,
                                size: 30,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                key: ValueKey('icon'),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => Registerpage(),
                        ),
                      );
                    },
                    child: Text(
                      "Doesn't Have a Account ? Register Here",
                      style: TextStyle(
                        color: Colors.green[900],
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green[900],
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TopClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     debugPrint(size.toString());

//     // First Wave
//     var path = Path();
//     path.lineTo(0, size.height); // start from bottom left
//     var firstControlPoint = Offset(0, size.height * 0.85);
//     var firstEndPoint = Offset(size.width * 0.1, size.height * 0.85);

//     path.quadraticBezierTo(
//       firstControlPoint.dx,
//       firstControlPoint.dy,
//       firstEndPoint.dx,
//       firstEndPoint.dy,
//     );

//     var firstStraightPoint = Offset(0, size.height * 0.85);
//     var secondStrightPoint = Offset(size.width * 0.9, size.height * 0.85);

//     path.quadraticBezierTo(
//       firstStraightPoint.dx,
//       firstStraightPoint.dy,
//       secondStrightPoint.dx,
//       secondStrightPoint.dy,
//     );
//     // Second Wave
//     var secondControlPoint = Offset(size.width, size.height * 0.85);
//     var secondEndPoint = Offset(size.width, size.height);
//     path.quadraticBezierTo(
//       secondControlPoint.dx,
//       secondControlPoint.dy,
//       secondEndPoint.dx,
//       secondEndPoint.dy,
//     );

//     path.lineTo(size.width, 0); // top right
//     path.close(); // close the path to form a shape
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false; // Return true if you want to reclip when something changes
//   }
// }
