import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:discoverlanka/components/userProfileComponents.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Green header section ──────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 54, 70, 54),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                        authservice
                                .currentUser()
                                ?.userMetadata?['avatar_url'] ??
                            'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${authservice.currentUser()?.userMetadata?['first_name'] ?? ''} '
                    '${authservice.currentUser()?.userMetadata?['last_name'] ?? ''}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    authservice.currentUser()?.email ?? '',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            UserProfileComponents(textString: 'Account Details', iconData: Icons.person),
            SizedBox(height: 20),
            UserProfileComponents(textString: 'Email Change', iconData: Icons.email),
            SizedBox(height: 20),
            UserProfileComponents(textString: 'Password Change', iconData: Icons.lock),
            SizedBox(height: 20),
            UserProfileComponents(textString: 'Logout', iconData: Icons.logout),
          ],
        ),
      ),
    );
  }
}
