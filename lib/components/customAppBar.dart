import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:discoverlanka/ui/userprofile.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  final authService = AuthService();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final user = authService.currentUser();
    final firstName =
        user?.userMetadata?['first_name'] as String? ?? '';
    final lastName =
        user?.userMetadata?['last_name'] as String? ?? '';
    final initials = [
      if (firstName.isNotEmpty) firstName[0].toUpperCase(),
      if (lastName.isNotEmpty) lastName[0].toUpperCase(),
    ].join(' · ');

    final displayName = initials.isNotEmpty
        ? initials
        : (user?.email != null && user!.email!.contains('@')
            ? user.email!.split('@')[0]
            : 'Profile');

    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  pause: const Duration(milliseconds: 1500),
                  animatedTexts: [
                    TyperAnimatedText(
                      'DISCOVER LANKA',
                      speed: const Duration(milliseconds: 120),
                    ),
                    TyperAnimatedText(
                      'Welcome to Sri Lanka!',
                      speed: const Duration(milliseconds: 80),
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          user == null
              ? ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()),
                    );
                  },
                  icon: const Icon(Icons.person_2_rounded,
                      color: Colors.white, size: 18),
                  label: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 34, 139, 34),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfile()),
                    );
                  },
                  icon: const Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  label: Text(
                    displayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 34, 139, 34),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
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
