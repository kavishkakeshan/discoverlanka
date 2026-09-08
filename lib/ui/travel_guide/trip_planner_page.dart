import 'package:discoverlanka/components/appDrawer.dart';
import 'package:discoverlanka/components/booking_modal.dart';
import 'package:discoverlanka/components/customAppBar.dart';
import 'package:flutter/material.dart';

class TripPlannerPage extends StatefulWidget {
  final bool showAppBarAndDrawer;

  const TripPlannerPage({super.key, this.showAppBarAndDrawer = true});

  @override
  State<TripPlannerPage> createState() => _TripPlannerPageState();
}

class _TripPlannerPageState extends State<TripPlannerPage> {
  int _selectedDays = 5;
  String _selectedStyle = 'Culture & Heritage';
  String _startingCity = 'Colombo / Airport (CMB)';

  final List<int> _durationOptions = [3, 5, 7, 10];

  final List<String> _styleOptions = [
    'Culture & Heritage',
    'Wildlife & Safari',
    'Beaches & Surf',
    'Highlands & Tea Country',
    'Complete Highlights',
  ];

  final List<String> _startingOptions = [
    'Colombo / Airport (CMB)',
    'Kandy',
    'Galle',
  ];

  // Generate dynamic days based on options
  List<Map<String, dynamic>> _generateItinerary() {
    if (_selectedStyle == 'Culture & Heritage') {
      return [
        {
          'day': 1,
          'title': 'Arrival & Negombo Canal Cruiser',
          'route': 'Airport -> Negombo',
          'morning': 'Arrival at Bandaranaike International Airport',
          'afternoon': 'Lagoon boat cruise and Dutch canal exploration',
          'evening': 'Seafood dinner on Negombo beach',
          'stay': 'Jetwing Blue, Negombo',
        },
        {
          'day': 2,
          'title': 'Dambulla Cave Murals & Sigiriya',
          'route': 'Negombo -> Dambulla -> Sigiriya',
          'morning': 'Drive through Kurunegala to Dambulla Cave Temple',
          'afternoon': 'Check-in to Sigiriya forest eco-lodge',
          'evening': 'Sunset climb of Pidurangala Rock overlooking Sigiriya',
          'stay': 'Aliya Resort, Sigiriya',
        },
        {
          'day': 3,
          'title': 'Sigiriya Lion Rock & Polonnaruwa',
          'route': 'Sigiriya -> Polonnaruwa',
          'morning': 'Ascend the 1,200 steps of Sigiriya Lion Rock Fortress',
          'afternoon': 'Cycle through the ancient ruins of Polonnaruwa',
          'evening': 'Traditional Sri Lankan rice and curry village feast',
          'stay': 'Heritance Kandalama',
        },
        if (_selectedDays >= 5) ...[
          {
            'day': 4,
            'title': 'Sacred Kandy & Temple of the Tooth',
            'route': 'Sigiriya -> Matale -> Kandy',
            'morning': 'Spice garden herbal tour in Matale',
            'afternoon': 'Walk around serene Kandy Lake and Peradeniya Gardens',
            'evening': 'Evening Puja ceremony at Temple of the Sacred Tooth',
            'stay': 'Earl\'s Regency, Kandy',
          },
          {
            'day': 5,
            'title': 'Pinnawala Elephants & Departure',
            'route': 'Kandy -> Colombo Airport',
            'morning': 'Pinnawala Elephant river bath viewing',
            'afternoon': 'Souvenir shopping at Barefoot Colombo',
            'evening': 'Transfer to airport for flight departure',
            'stay': 'Departure',
          },
        ],
        if (_selectedDays >= 7) ...[
          {
            'day': 6,
            'title': 'Galle Dutch Fort Heritage',
            'route': 'Kandy -> Galle via Expressway',
            'morning': 'Scenic drive to UNESCO Galle Dutch Fort',
            'afternoon': 'Explore cobblestone alleys, gem boutiques & museums',
            'evening': 'Sunset rampart walk by the iconic white lighthouse',
            'stay': 'Fort Bazaar, Galle',
          },
          {
            'day': 7,
            'title': 'Southern Coast & Airport Return',
            'route': 'Galle -> Colombo Airport',
            'morning': 'Stilt fishermen photo stop at Weligama',
            'afternoon': 'Expressway cruise to Colombo',
            'evening': 'Airport transfer',
            'stay': 'Departure',
          },
        ],
        if (_selectedDays >= 10) ...[
          {
            'day': 8,
            'title': 'Anuradhapura Sacred Stupas',
            'route': 'Cultural Triangle -> Anuradhapura',
            'morning': 'Visit the ancient Jaya Sri Maha Bodhi tree',
            'afternoon': 'Marvel at Ruwanwelisaya and Jetavanaramaya',
            'evening': 'Sunset meditation at Twin Ponds',
            'stay': 'Ulagalla Resort',
          },
          {
            'day': 9,
            'title': 'Mihintale Sacred Hillside',
            'route': 'Anuradhapura -> Mihintale',
            'morning': 'Climb the 1,840 stone steps of Mihintale',
            'afternoon': 'Explore ancient Ayurvedic hospital ruins',
            'evening': 'Stargazing in dry zone sanctuary',
            'stay': 'Ulagalla Resort',
          },
          {
            'day': 10,
            'title': 'Colombo Capital Tour & Farewell',
            'route': 'Anuradhapura -> Colombo Airport',
            'morning': 'Drive to Colombo city',
            'afternoon': 'Gangaramaya Temple and Independence Square',
            'evening': 'Airport departure',
            'stay': 'Departure',
          },
        ],
      ];
    } else if (_selectedStyle == 'Wildlife & Safari') {
      return [
        {
          'day': 1,
          'title': 'Arrival & Udawalawe Elephant Sanctuary',
          'route': 'Colombo Airport -> Udawalawe',
          'morning': 'Airport pickup and journey south',
          'afternoon': 'Elephant Transit Home feeding session',
          'evening': 'Sunset 4x4 safari across Udawalawe grasslands',
          'stay': 'Grand Udawalawe Safari Resort',
        },
        {
          'day': 2,
          'title': 'Yala Leopard Safari Block 1',
          'route': 'Udawalawe -> Yala',
          'morning': 'Dawn birdwatching near the reservoir',
          'afternoon': 'Check in to luxury glamping tent beside Yala border',
          'evening': 'Afternoon 4x4 open-top leopard safari',
          'stay': 'Cinnamon Wild Yala',
        },
        {
          'day': 3,
          'title': 'Mirissa Whale Watching & Turtles',
          'route': 'Yala -> Mirissa',
          'morning': 'Dawn predator tracking safari',
          'afternoon': 'Snorkel with wild green sea turtles at Polhena',
          'evening': 'Seafood beach barbecue under the stars',
          'stay': 'Mandara Resort, Mirissa',
        },
        if (_selectedDays >= 5) ...[
          {
            'day': 4,
            'title': 'Ocean Whale Cruise & Sinharaja Edge',
            'route': 'Mirissa -> Sinharaja',
            'morning': 'Offshore Blue Whale & Dolphin boat expedition',
            'afternoon': 'Journey into the rainforest buffer zone',
            'evening': 'Evening rainforest chorus walk',
            'stay': 'Rainforest Eco Lodge, Sinharaja',
          },
          {
            'day': 5,
            'title': 'Sinharaja Endemic Birds & Return',
            'route': 'Sinharaja -> Colombo Airport',
            'morning': 'Guided primary rainforest trek with naturalist',
            'afternoon': 'Swim in crystalline jungle natural pool',
            'evening': 'Transfer to airport for flight departure',
            'stay': 'Departure',
          },
        ],
        if (_selectedDays >= 7) ...[
          {
            'day': 6,
            'title': 'Minneriya Elephant Gathering',
            'route': 'Sinharaja -> Minneriya',
            'morning': 'Drive to North Central plains',
            'afternoon': 'World-famous Minneriya Elephant Gathering safari',
            'evening': 'Dinner by ancient tank reservoir',
            'stay': 'Cinnamon Lodge Habarana',
          },
          {
            'day': 7,
            'title': 'Wilpattu Leopard Land & Airport',
            'route': 'Minneriya -> Wilpattu -> Airport',
            'morning': 'Dawn safari around Wilpattu sand-rimmed lakes',
            'afternoon': 'Drive to Colombo Airport',
            'evening': 'Departure',
            'stay': 'Departure',
          },
        ],
        if (_selectedDays >= 10) ...[
          {
            'day': 8,
            'title': 'Bundala Ramsar Wetland Reserve',
            'route': 'Hambantota Coastal Wetlands',
            'morning': 'Spot Greater Flamingos and rare migratory waders',
            'afternoon': 'Coastal lagoon boat cruise',
            'evening': 'Campfire on the dunes',
            'stay': 'Jetwing Yala',
          },
          {
            'day': 9,
            'title': 'Kumana Bird Paradise',
            'route': 'Yala East / Kumana',
            'morning': 'Kumana mangrove swamp birding trek',
            'afternoon': 'Explore Okanda Murugan coastal shrine',
            'evening': 'Overnight eco-cabin',
            'stay': 'Kumana Safari Camp',
          },
          {
            'day': 10,
            'title': 'Return via Colombo & Farewell',
            'route': 'Kumana -> Colombo Airport',
            'morning': 'Expressway return journey',
            'afternoon': 'Colombo highlights and shopping',
            'evening': 'Airport departure',
            'stay': 'Departure',
          },
        ],
      ];
    } else {
      // Default / Complete Highlights
      return [
        {
          'day': 1,
          'title': 'Arrival & Ancient Sigiriya',
          'route': 'Airport -> Sigiriya',
          'morning': 'Airport greeting and transfer to Central plains',
          'afternoon': 'Visit Dambulla Rock Cave Temples',
          'evening': 'Check-in and evening pool view of Sigiriya Rock',
          'stay': 'Aliya Resort & Spa',
        },
        {
          'day': 2,
          'title': 'Sigiriya Lion Rock & Spice Country',
          'route': 'Sigiriya -> Matale -> Kandy',
          'morning': 'Ascend the 1,200 steps to the Sigiriya summit',
          'afternoon': 'Matale herbal spice garden tour',
          'evening': 'Temple of the Sacred Tooth Relic evening puja',
          'stay': 'Earl\'s Regency, Kandy',
        },
        {
          'day': 3,
          'title': 'Scenic Blue Train to Ella',
          'route': 'Kandy -> Ella by Train',
          'morning': 'Board the iconic blue highland train',
          'afternoon': 'Cross the Demodara Nine Arch Bridge',
          'evening': 'Little Adam\'s Peak sunset walk',
          'stay': '98 Acres Resort, Ella',
        },
        if (_selectedDays >= 5) ...[
          {
            'day': 4,
            'title': 'Yala Safari & Southern Coast',
            'route': 'Ella -> Yala -> Mirissa',
            'morning': 'Ravana Falls photo stop and descent to plains',
            'afternoon': 'Thrilling 4x4 leopard game drive in Yala',
            'evening': 'Check-in at southern beachfront resort',
            'stay': 'Mandara Resort, Mirissa',
          },
          {
            'day': 5,
            'title': 'Galle Dutch Fort & Airport Return',
            'route': 'Mirissa -> Galle -> Colombo Airport',
            'morning': 'Whale watching or surf session in Mirissa',
            'afternoon': 'UNESCO Galle Dutch Fort walking tour',
            'evening': 'Expressway transfer to CMB Airport',
            'stay': 'Departure',
          },
        ],
        if (_selectedDays >= 7) ...[
          {
            'day': 6,
            'title': 'Bentota Water Sports & Turtle Sanctuary',
            'route': 'Galle -> Bentota',
            'morning': 'Kosgoda Sea Turtle Conservation project',
            'afternoon': 'Madu River boat safari with fish therapy',
            'evening': 'Sunset dinner on Bentota sand spit',
            'stay': 'Cinnamon Bentota Beach',
          },
          {
            'day': 7,
            'title': 'Colombo Capital Highlights & Departure',
            'route': 'Bentota -> Colombo -> Airport',
            'morning': 'Drive to Colombo capital',
            'afternoon': 'Independence Memorial Hall and souvenir shopping',
            'evening': 'Airport departure',
            'stay': 'Departure',
          },
        ],
        if (_selectedDays >= 10) ...[
          {
            'day': 8,
            'title': 'Nuwara Eliya Tea Gardens',
            'route': 'Kandy -> Nuwara Eliya',
            'morning': 'Drive through Ramboda waterfalls pass',
            'afternoon': 'Tea factory masterclass and high tea at Grand Hotel',
            'evening': 'Boating on Gregory Lake',
            'stay': 'The Grand Hotel, Nuwara Eliya',
          },
          {
            'day': 9,
            'title': 'Horton Plains & World\'s End',
            'route': 'Nuwara Eliya -> Horton Plains',
            'morning': 'Dawn 9.5km trek to 870m World\'s End precipice',
            'afternoon': 'Baker\'s Falls waterfall trail',
            'evening': 'Fireplace dinner in colonial bungalow',
            'stay': 'The Grand Hotel',
          },
          {
            'day': 10,
            'title': 'Descent to Coast & Departure',
            'route': 'Highlands -> Colombo Airport',
            'morning': 'Scenic mountain descent',
            'afternoon': 'Colombo city tour',
            'evening': 'Flight departure',
            'stay': 'Departure',
          },
        ],
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final itinerary = _generateItinerary();

    final content = SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
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
                          color: Colors.white.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'SMART ROUTE GENERATOR',
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
                        'Design Your Dream Sri Lanka Journey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Select your preferences and get an instant, route-optimized itinerary with curated stays and transit tips.',
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
                const Icon(Icons.auto_awesome, color: Colors.amber, size: 48),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Configuration Card
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Duration
                  const Text(
                    '1. Trip Duration',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: _durationOptions.map((days) {
                      final isSelected = _selectedDays == days;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedDays = days;
                              });
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color.fromARGB(255, 34, 139, 34)
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.transparent
                                      : Colors.grey.shade300,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '$days Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 18),

                  // 2. Travel Style
                  const Text(
                    '2. Travel Vibe / Theme',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedStyle,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.palette_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                    ),
                    items: _styleOptions
                        .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _selectedStyle = val;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 18),

                  // 3. Starting City
                  const Text(
                    '3. Starting Hub',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: _startingCity,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.flight_land),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                    ),
                    items: _startingOptions
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _startingCity = val;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // Generate Action
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Generated $_selectedDays-Day $_selectedStyle route!',
                            ),
                            backgroundColor: Colors.green.shade700,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.flash_on, color: Colors.white),
                      label: const Text(
                        'Generate Custom Itinerary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 34, 139, 34),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Generated Timeline
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_selectedDays-Day Custom Itinerary',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _selectedStyle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          ...itinerary.map((day) => _buildItineraryDayCard(context, day)),

          const SizedBox(height: 20),

          // Inquiry CTA
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Column(
              children: [
                const Icon(Icons.directions_car,
                    size: 40, color: Color.fromARGB(255, 34, 139, 34)),
                const SizedBox(height: 8),
                const Text(
                  'Want this custom itinerary organized for you?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'We pair you with a licensed private chauffeur guide, arrange scenic train tickets, and reserve handpicked boutique hotels.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () {
                    showBookingModal(
                      context: context,
                      itemTitle: 'Custom $_selectedDays-Day $_selectedStyle Tour',
                      itemCategory: 'Tailor-made Trip',
                    );
                  },
                  icon: const Icon(Icons.bookmark_add, color: Colors.white),
                  label: const Text(
                    'Book / Inquire This Plan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 139, 34),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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

    if (!widget.showAppBarAndDrawer) {
      return content;
    }

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(currentRoute: 'tripplanner'),
      body: content,
    );
  }

  Widget _buildItineraryDayCard(
      BuildContext context, Map<String, dynamic> day) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'DAY ${day['day']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    day['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.route, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  day['route'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            _buildTimeSlot(Icons.wb_sunny_outlined, 'Morning', day['morning']),
            const SizedBox(height: 6),
            _buildTimeSlot(
                Icons.wb_twilight_outlined, 'Afternoon', day['afternoon']),
            const SizedBox(height: 6),
            _buildTimeSlot(Icons.nightlight_outlined, 'Evening', day['evening']),
            const Divider(height: 16),
            Row(
              children: [
                Icon(Icons.hotel_outlined,
                    size: 16, color: Colors.green.shade800),
                const SizedBox(width: 6),
                Text(
                  'Recommended Stay: ${day['stay']}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(IconData icon, String slot, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.green.shade600),
        const SizedBox(width: 8),
        Text(
          '$slot: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: Text(
            desc,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
