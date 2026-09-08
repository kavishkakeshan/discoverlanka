import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/bottomNavigation.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:discoverlanka/ui/blog_page.dart';
import 'package:discoverlanka/ui/dashboard.dart';
import 'package:discoverlanka/ui/destinationspage.dart';
import 'package:discoverlanka/ui/tours_page.dart';
import 'package:discoverlanka/ui/travel_guide/trip_planner_page.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String get _currentRouteName {
    switch (_currentIndex) {
      case 0:
        return 'home';
      case 1:
        return 'destinations';
      case 2:
        return 'tours';
      case 3:
        return 'tripplanner';
      case 4:
        return 'blog';
      default:
        return 'home';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      DashboardContent(
        onExplorePlacesPressed: () => _onTabChanged(1),
        onBookToursPressed: () => _onTabChanged(2),
        onPlanTripPressed: () => _onTabChanged(3),
      ),
      const Destinationspage(showAppBarAndDrawer: false),
      const ToursPage(showAppBarAndDrawer: false),
      const TripPlannerPage(showAppBarAndDrawer: false),
      const BlogPage(showAppBarAndDrawer: false),
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(
        currentRoute: _currentRouteName,
        onNavigateTab: _onTabChanged,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _currentIndex,
        onTabChange: _onTabChanged,
      ),
    );
  }
}
