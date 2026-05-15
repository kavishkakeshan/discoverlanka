import 'dart:async';

import 'package:discoverlanka/components/ComProfile/userProfileEmailChange.dart';
import 'package:discoverlanka/components/ComProfile/userProfilePasswordChange.dart';
import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/bottomNavigation.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:discoverlanka/components/ComProfile/userProfileComponents.dart';
import 'package:discoverlanka/components/ComProfile/userProfileAccInfo.dart';
import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final authservice = AuthService();
  // StreamSubscription<AuthState>? _authSubscription;

  Future<void> _refreshUserProfile() async {
    try {
      await authservice.refreshUserDetails();
      if (mounted) {
        setState(() {}); // Rebuild UI with fresh data
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to refresh: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshUserProfile,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
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
              UserProfileComponents(
                textString: 'Account Details',
                iconData: Icons.person,
                onTap: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => Userprofileaccinfo(),
                  );
                  if (result == true) {
                    _refreshUserProfile();
                  }
                },
              ),
              SizedBox(height: 20),
              UserProfileComponents(
                textString: 'Email Change',
                iconData: Icons.email,
                onTap: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => UserprofileEmailchange(),
                  );
                  if (result == true) {
                    _refreshUserProfile();
                  }
                },
              ),
              SizedBox(height: 20),
              UserProfileComponents(
                textString: 'Password Change',
                iconData: Icons.lock,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => UserprofilePasswordchange(),
                ),
              ),
              SizedBox(height: 20),
              UserProfileComponents(
                textString: 'Delete Account',
                iconData: Icons.delete,
                backgroundColor: Colors.red,
                onTap: () async {
                  await authservice.deleteUser();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Your account has been deleted.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Follow us on: ', style: TextStyle(color: Colors.black)),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.xTwitter,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
