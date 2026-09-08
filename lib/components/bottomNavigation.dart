import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTabChange;

  const BottomNavigation({
    super.key,
    this.selectedIndex = 0,
    this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.green.shade100,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.green.shade100.withValues(alpha: 0.5),
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
            gap: 6,
            backgroundColor: Colors.transparent,
            color: Colors.green.shade800,
            activeColor: Colors.white,
            iconSize: 20,
            textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            tabBackgroundGradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 34, 139, 34),
                Color(0xFF34D399),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            tabBorderRadius: 14,
            tabs: const [
              GButton(icon: Icons.home_outlined, text: 'Home'),
              GButton(icon: Icons.explore_outlined, text: 'Places'),
              GButton(icon: Icons.luggage_outlined, text: 'Tours'),
              GButton(icon: Icons.route_outlined, text: 'Planner'),
              GButton(icon: Icons.article_outlined, text: 'Blog'),
            ],
          ),
        ),
      ),
    );
  }
}
