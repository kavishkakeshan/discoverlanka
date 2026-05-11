import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:discoverlanka/ui/userprofile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final authService = AuthService();

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Just close the dialog
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
              ),
              child: const Text('Yes', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog first
                authService.signOut(); // Then sign out
                if (authService.currentUser() == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You have been logged out.'),
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
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              if (authService.currentUser() != null) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserProfile()));
              }
            },
            child: UserAccountsDrawerHeader(
              accountName:
                  authService.currentUser()?.userMetadata?['first_name'] != null
                  ? Text(
                      '${authService.currentUser()?.userMetadata?['first_name'] ?? ''} ${authService.currentUser()?.userMetadata?['last_name'] ?? ''}'
                          .trim(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Guest User',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
              accountEmail: Text(
                authService.currentUser()?.email ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 43, 156, 46),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 81, 156, 144),
                child: const Icon(Icons.person, size: 50.0, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.green.shade400),
            title: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
              // Add navigation logic here if needed:
              // Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.location_pin, color: Colors.green.shade400),
            title: const Text(
              'Destinations',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.airplane_ticket, color: Colors.green.shade400),
            title: const Text(
              'Tours & Packages',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            shape: const Border(),
            collapsedShape: const Border(),
            leading: Icon(Icons.map_sharp, color: Colors.green.shade400),
            title: const Text(
              'Travel Guide',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            childrenPadding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            children: [
              ListTile(
                leading: Icon(Icons.route, color: Colors.greenAccent.shade700),
                title: const Text(
                  'Trip Planner',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.directions_bus,
                  color: Colors.greenAccent.shade700,
                ),
                title: const Text(
                  'Transport Services',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Colors.greenAccent.shade700,
                ),
                title: const Text(
                  'Travel Agencies',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.hotel, color: Colors.greenAccent.shade700),
                title: const Text(
                  'Hotels & Accommodations',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb,
                  color: Colors.greenAccent.shade700,
                ),
                title: const Text(
                  'Travel Tips & Safety',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.calendar_month, color: Colors.green.shade400),
            title: const Text(
              'Events & Festivals',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.article, color: Colors.green.shade400),
            title: const Text(
              'Blog & Articles',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone, color: Colors.green.shade400),
            title: const Text(
              'Contact Us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                _showMyDialog(context);
              },
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text(
                'Logout',
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
          ),
        ],
      ),
    );
  }
}
