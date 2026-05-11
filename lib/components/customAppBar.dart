import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:discoverlanka/ui/userprofile.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  final authService = AuthService();
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade500,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  pause: Duration(milliseconds: 1500),
                  animatedTexts: [
                    TyperAnimatedText(
                      'DISCOVER LANKA',
                      speed: Duration(milliseconds: 200),
                    ),
                    TyperAnimatedText(
                      'Welcome to Sri Lanka !!!',
                      speed: Duration(milliseconds: 100),
                      textStyle: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          authService.currentUser() == null
              ? ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  icon: Icon(Icons.person_2_rounded, color: Colors.white),
                  label: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: () {
                    // User Profile
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    authService.currentUser()?.userMetadata?['first_name'] ??
                        '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
