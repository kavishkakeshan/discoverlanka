import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:discoverlanka/data/travel_guide_data.dart';
import 'package:flutter/material.dart';

class TravelTipsPage extends StatelessWidget {
  final bool showAppBarAndDrawer;

  const TravelTipsPage({super.key, this.showAppBarAndDrawer = true});

  @override
  Widget build(BuildContext context) {
    final bodyContent = SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 34, 139, 34),
                  Colors.green.shade800,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'ESSENTIAL TRAVELER GUIDE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Travel Tips & Safety',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Crucial insights on visa ETA, local currency, monsoon weather, SIM cards, temple dress code & 24/7 tourist helplines.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.security, color: Colors.white70, size: 48),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Emergency Quick Dial Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_in_talk,
                        color: Colors.red.shade700, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Emergency Hotlines in Sri Lanka',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red.shade900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildEmergencyChip(
                        'Tourist Police', '1912', Colors.blue.shade700),
                    const SizedBox(width: 8),
                    _buildEmergencyChip(
                        'Ambulance', '1990', Colors.red.shade700),
                    const SizedBox(width: 8),
                    _buildEmergencyChip(
                        'Police', '119', Colors.indigo.shade700),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Tips Categories
          ...travelTipsData.map((category) => _buildTipCard(category)),

          const SizedBox(height: 20),
        ],
      ),
    );

    if (!showAppBarAndDrawer) {
      return bodyContent;
    }

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(currentRoute: 'tips'),
      body: bodyContent,
    );
  }

  Widget _buildEmergencyChip(String label, String number, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(TravelTipCategory category) {
    IconData getIcon(String name) {
      switch (name) {
        case 'badge':
          return Icons.badge_outlined;
        case 'payments':
          return Icons.payments_outlined;
        case 'wifi':
          return Icons.wifi;
        case 'wb_sunny':
          return Icons.wb_sunny_outlined;
        case 'temple_buddhist':
          return Icons.temple_buddhist_outlined;
        case 'emergency':
          return Icons.health_and_safety_outlined;
        default:
          return Icons.lightbulb_outline;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    getIcon(category.icon),
                    color: Colors.green.shade800,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        category.subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            ...category.tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 17,
                      color: Colors.green.shade700,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tip,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
