import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/booking_modal.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:discoverlanka/data/travel_guide_data.dart';
import 'package:flutter/material.dart';

class TransportPage extends StatelessWidget {
  final bool showAppBarAndDrawer;

  const TransportPage({super.key, this.showAppBarAndDrawer = true});

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
                          'GETTING AROUND SRI LANKA',
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
                        'Transport & Travel Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'From the world\'s most scenic trains to private chauffeur guides and local tuk-tuks, find the best way to travel.',
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
                const Icon(Icons.train, color: Colors.white70, size: 50),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Transport list
          const Text(
            'Modes of Transport & Guidelines',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          ...transportGuides.map((guide) => _buildTransportCard(context, guide)),

          const SizedBox(height: 20),

          // Private Vehicle Booking Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.directions_car,
                        color: Colors.green.shade800, size: 28),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Need a Private Chauffeur Guide?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Book a verified, English-speaking driver with an air-conditioned sedan or luxury van. Includes fuel, highway tolls, and driver accommodation.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () {
                    showBookingModal(
                      context: context,
                      itemTitle: 'Private Chauffeur Car Rental',
                      itemCategory: 'Transport Service',
                      estimatedPrice: 65,
                    );
                  },
                  icon: const Icon(Icons.calendar_today, color: Colors.white, size: 18),
                  label: const Text(
                    'Book Private Chauffeur Vehicle',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 139, 34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );

    if (!showAppBarAndDrawer) {
      return bodyContent;
    }

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(currentRoute: 'transport'),
      body: bodyContent,
    );
  }

  Widget _buildTransportCard(BuildContext context, TransportGuideItem guide) {
    IconData getIconData(String iconName) {
      switch (iconName) {
        case 'train':
          return Icons.train_outlined;
        case 'car':
          return Icons.directions_car_outlined;
        case 'electric_rickshaw':
          return Icons.electric_rickshaw_outlined;
        case 'phone_android':
          return Icons.phone_android_outlined;
        case 'directions_bus':
          return Icons.directions_bus_outlined;
        default:
          return Icons.commute;
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    getIconData(guide.icon),
                    color: Colors.green.shade800,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          guide.type,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        guide.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              guide.description,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_outline,
                      size: 18, color: Colors.amber.shade900),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      guide.tips,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.brown.shade900,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.monetization_on_outlined,
                        size: 16, color: Colors.green.shade700),
                    const SizedBox(width: 4),
                    Text(
                      guide.costEstimate,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
                if (guide.icon == 'train' || guide.icon == 'car')
                  TextButton.icon(
                    onPressed: () {
                      showBookingModal(
                        context: context,
                        itemTitle: guide.title,
                        itemCategory: 'Transport Booking',
                      );
                    },
                    icon: const Icon(Icons.confirmation_number_outlined,
                        size: 16),
                    label: const Text('Book Tickets / Vehicle'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 34, 139, 34),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
