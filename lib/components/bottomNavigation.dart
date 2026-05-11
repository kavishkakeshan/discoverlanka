import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFECFDF5), Color(0xFFD1FAE5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border(top: BorderSide(color: Colors.green[100]!, width: 1)),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.green[100]!.withOpacity(0.5),
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            gap: 6,
            backgroundColor: Colors.transparent,
            color: Colors.green[800]!,
            activeColor: Colors.white,
            iconSize: 22,
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            tabBackgroundGradient: LinearGradient(
              colors: [Color(0xFF10B981), Color(0xFF34D399)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            padding: EdgeInsets.all(16),
            tabBorderRadius: 12,
            tabs: [
              GButton(icon: Icons.home_outlined, text: 'Home'),
              GButton(icon: Icons.route, text: 'Directions'),
              GButton(icon: Icons.library_books_outlined, text: 'Blog'),
              GButton(icon: Icons.settings_outlined, text: 'Settings'),
            ],
          ),
        ),
    );
  }
}