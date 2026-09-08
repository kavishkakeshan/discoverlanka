import 'package:discoverlanka/components/ComSlides/customExploreSlides.dart';
import 'package:discoverlanka/components/ComSlides/customTravelersSlide.dart';
import 'package:discoverlanka/components/ComSlides/customWhyChooseSlides.dart';
import 'package:discoverlanka/components/customInputField.dart';
import 'package:discoverlanka/data/slideDataList.dart';
import 'package:discoverlanka/ui/destinationspage.dart';
import 'package:discoverlanka/ui/events_page.dart';
import 'package:discoverlanka/ui/main_navigation.dart';
import 'package:discoverlanka/ui/tours_page.dart';
import 'package:discoverlanka/ui/travel_guide/hotels_page.dart';
import 'package:discoverlanka/ui/travel_guide/transport_page.dart';
import 'package:discoverlanka/ui/travel_guide/travel_tips_page.dart';
import 'package:discoverlanka/ui/travel_guide/trip_planner_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Dashboard extends StatelessWidget {
  final int initialIndex;

  const Dashboard({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MainNavigationScreen(initialIndex: initialIndex);
  }
}

class DashboardContent extends StatefulWidget {
  final VoidCallback? onExplorePlacesPressed;
  final VoidCallback? onBookToursPressed;
  final VoidCallback? onPlanTripPressed;

  const DashboardContent({
    super.key,
    this.onExplorePlacesPressed,
    this.onBookToursPressed,
    this.onPlanTripPressed,
  });

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _subscribeNewsletter() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Thank you for subscribing to DiscoverLanka!'),
          ],
        ),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Action Pill Bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            color: Colors.green.shade50.withValues(alpha: 0.6),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildQuickPill(
                    icon: Icons.explore,
                    label: '18+ Places',
                    onTap: widget.onExplorePlacesPressed ??
                        () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Destinationspage()),
                            ),
                  ),
                  const SizedBox(width: 8),
                  _buildQuickPill(
                    icon: Icons.luggage,
                    label: 'Tours & Safari',
                    onTap: widget.onBookToursPressed ??
                        () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ToursPage()),
                            ),
                  ),
                  const SizedBox(width: 8),
                  _buildQuickPill(
                    icon: Icons.route,
                    label: 'Trip Planner',
                    onTap: widget.onPlanTripPressed ??
                        () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TripPlannerPage()),
                            ),
                  ),
                  const SizedBox(width: 8),
                  _buildQuickPill(
                    icon: Icons.train,
                    label: 'Trains & Transport',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TransportPage()),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildQuickPill(
                    icon: Icons.hotel,
                    label: 'Resorts & Stays',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotelsPage()),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildQuickPill(
                    icon: Icons.festival,
                    label: 'Festivals',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventsPage()),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildQuickPill(
                    icon: Icons.security,
                    label: 'Travel Tips',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TravelTipsPage()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Why Choose Sri Lanka
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Why Choose Sri Lanka?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomWhyChooseSlides(slides: carouselWhyChooseSlides),
          const SizedBox(height: 24),

          // Explore Our Paradise with action
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore Our Paradise',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: widget.onExplorePlacesPressed ??
                      () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Destinationspage()),
                          ),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CustomExploreSlides(slides: carouselExploreSlides(context)),
          const SizedBox(height: 24),

          // What Our Travelers Say
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'What Our Travelers Say',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomTravelesSlides(slides: carouselTravelersSlides),
          const SizedBox(height: 30),

          // Subscribe Newsletter Container
          Container(
            color: const Color.fromARGB(255, 0, 102, 34),
            padding:
                const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Subscribe to Our Newsletter',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Get the latest travel updates, hidden gems, and exclusive tour offers straight to your inbox.',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        name: 'email',
                        labelText: 'Enter Your Email',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(
                            errorText: 'Please enter a valid email address.',
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _subscribeNewsletter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 0, 102, 34),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Follow us on: ',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.xTwitter,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.youtube,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickPill({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade100.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.green.shade800),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
