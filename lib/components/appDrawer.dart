import 'package:discoverlanka/supabase/auth_service.dart';
import 'package:discoverlanka/ui/contact_us_page.dart';
import 'package:discoverlanka/ui/events_page.dart';
import 'package:discoverlanka/ui/loginpage.dart';
import 'package:discoverlanka/ui/main_navigation.dart';
import 'package:discoverlanka/ui/travel_guide/hotels_page.dart';
import 'package:discoverlanka/ui/travel_guide/transport_page.dart';
import 'package:discoverlanka/ui/travel_guide/travel_tips_page.dart';
import 'package:discoverlanka/ui/userprofile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final ValueChanged<int>? onNavigateTab;
  final String? currentRoute;

  AppDrawer({
    super.key,
    this.onNavigateTab,
    this.currentRoute,
  });

  final authService = AuthService();

  void _handleTabNavigation(BuildContext context, int tabIndex, String routeName) {
    Navigator.pop(context); // Close the drawer exactly once
    if (currentRoute == routeName) return;

    if (onNavigateTab != null) {
      onNavigateTab!(tabIndex);
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainNavigationScreen(initialIndex: tabIndex),
        ),
        (route) => false,
      );
    }
  }

  void _handlePageNavigation(BuildContext context, Widget page, String routeName) {
    Navigator.pop(context); // Close the drawer exactly once
    if (currentRoute == routeName) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Icon(Icons.logout_rounded, color: Colors.red),
              SizedBox(width: 10),
              Text('Logout Confirmation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Text('Are you sure you want to log out of Discover Lanka?'),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await authService.signOut();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged out successfully.'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginpage()),
                    (route) => false,
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
    final user = authService.currentUser();
    final firstName = user?.userMetadata?['first_name'] as String?;
    final lastName = user?.userMetadata?['last_name'] as String?;
    final hasName = firstName != null && firstName.trim().isNotEmpty;
    final fullName = hasName ? '$firstName ${lastName ?? ''}'.trim() : 'Guest Explorer';

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            // Header
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                if (user != null) {
                  if (currentRoute != 'profile') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserProfile()),
                    );
                  }
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginpage()),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 24,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1B5E20),
                      Color(0xFF2E7D32),
                      Color(0xFF388E3C),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 2),
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                          child: Icon(
                            user != null ? Icons.person_rounded : Icons.explore_rounded,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                user != null ? Icons.verified_user_rounded : Icons.travel_explore,
                                size: 13,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                user != null ? 'Explorer' : 'Guest',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      user?.email ?? 'Tap to sign in or create an account',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            // Scrollable Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildSectionHeader('MAIN DISCOVERY'),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.home_rounded,
                    title: 'Home',
                    isSelected: currentRoute == 'home',
                    onTap: () => _handleTabNavigation(context, 0, 'home'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.location_on_rounded,
                    title: 'Destinations',
                    isSelected: currentRoute == 'destinations',
                    onTap: () => _handleTabNavigation(context, 1, 'destinations'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.airplane_ticket_rounded,
                    title: 'Tours & Packages',
                    isSelected: currentRoute == 'tours',
                    onTap: () => _handleTabNavigation(context, 2, 'tours'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.route_rounded,
                    title: 'Trip Planner',
                    isSelected: currentRoute == 'tripplanner',
                    onTap: () => _handleTabNavigation(context, 3, 'tripplanner'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.article_rounded,
                    title: 'Blog & Stories',
                    isSelected: currentRoute == 'blog',
                    onTap: () => _handleTabNavigation(context, 4, 'blog'),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Divider(height: 1),
                  ),

                  _buildSectionHeader('TRAVEL GUIDE & SERVICES'),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.directions_bus_rounded,
                    title: 'Transport Services',
                    isSelected: currentRoute == 'transport',
                    onTap: () => _handlePageNavigation(context, const TransportPage(), 'transport'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.hotel_rounded,
                    title: 'Hotels & Accommodations',
                    isSelected: currentRoute == 'hotels',
                    onTap: () => _handlePageNavigation(context, const HotelsPage(), 'hotels'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.calendar_month_rounded,
                    title: 'Events & Festivals',
                    isSelected: currentRoute == 'events',
                    onTap: () => _handlePageNavigation(context, const EventsPage(), 'events'),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.tips_and_updates_rounded,
                    title: 'Travel Tips & Safety',
                    isSelected: currentRoute == 'tips',
                    onTap: () => _handlePageNavigation(context, const TravelTipsPage(), 'tips'),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    child: Divider(height: 1),
                  ),

                  _buildSectionHeader('ACCOUNT & SUPPORT'),
                  if (user != null)
                    _buildDrawerItem(
                      context: context,
                      icon: Icons.person_outline_rounded,
                      title: 'My Profile',
                      isSelected: currentRoute == 'profile',
                      onTap: () => _handlePageNavigation(context, const UserProfile(), 'profile'),
                    ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.contact_support_rounded,
                    title: 'Contact Us',
                    isSelected: currentRoute == 'contact',
                    onTap: () => _handlePageNavigation(context, const ContactUsPage(), 'contact'),
                  ),
                ],
              ),
            ),

            // Footer Action
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  user != null
                      ? SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () => _showLogoutDialog(context),
                            icon: const Icon(Icons.logout_rounded, size: 18, color: Colors.red),
                            label: const Text(
                              'Sign Out',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red.shade300),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Loginpage()),
                              );
                            },
                            icon: const Icon(Icons.login_rounded, size: 18, color: Colors.white),
                            label: const Text(
                              'Sign In / Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1B5E20),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                          ),
                        ),
                  const SizedBox(height: 6),
                  Text(
                    'Discover Lanka • v1.0.0',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    final activeColor = const Color(0xFF1B5E20);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Material(
        color: isSelected ? const Color(0xFFE8F5E9) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: const Color(0xFFA5D6A7), width: 1) : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isSelected ? activeColor : const Color(0xFF388E3C),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                      color: isSelected ? activeColor : Colors.black87,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
