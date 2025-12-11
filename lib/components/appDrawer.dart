import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Kaviii'),
            accountEmail: const Text('kaviii@gmail.com'),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 43, 156, 46),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 81, 156, 144),
              child: const Icon(Icons.person, size: 50.0, color: Colors.white),
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
            leading: Icon(
              Icons.airplane_ticket,
              color: Colors.green.shade400,
            ),
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
                leading: Icon(Icons.directions_bus, color: Colors.greenAccent.shade700),
                title: const Text(
                  'Transport Services',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.location_city, color: Colors.greenAccent.shade700),
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
                leading: Icon(Icons.lightbulb, color: Colors.greenAccent.shade700),
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
        ],
      ),
    );
  }
}