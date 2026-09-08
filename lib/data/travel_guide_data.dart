import '../models/hotel_model.dart';

// --- HOTELS DATASET ---
const List<Hotel> allHotels = [
  Hotel(
    id: 'kandalama',
    name: 'Heritance Kandalama',
    location: 'Dambulla / Sigiriya',
    province: 'Central Province',
    type: 'Eco Luxury Resort',
    rating: 4.9,
    reviewCount: 1420,
    pricePerNight: '\$240 / night',
    imageUrl:
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?q=80&w=1200&auto=format&fit=crop',
    amenities: [
      'Infinity Pool',
      'Geoffrey Bawa Architecture',
      'Spa Naturel',
      'Lake View',
      'Free WiFi',
      'Fitness Center',
    ],
    description:
        'A masterpiece designed by iconic architect Geoffrey Bawa, built right into a cliff overlooking the ancient Kandalama Lake and Sigiriya Rock. Foliage envelopes the structure as monkeys leap between balconies.',
    phone: '+94 66 555 5000',
    email: 'kandalama@heritancehotels.com',
  ),
  Hotel(
    id: '98-acres',
    name: '98 Acres Resort & Spa',
    location: 'Ella Mountain Pass',
    province: 'Uva Province',
    type: 'Boutique Tea Estate',
    rating: 4.9,
    reviewCount: 980,
    pricePerNight: '\$280 / night',
    imageUrl:
        'https://images.unsplash.com/photo-1546708973-b339540b5162?q=80&w=1200&auto=format&fit=crop',
    amenities: [
      'Panoramic Mountain View',
      'Helipad',
      'Ayurveda Spa',
      'Swimming Pool',
      'Tea Factory Tours',
      'Restaurant & Bar',
    ],
    description:
        'An elegant, chic hotel that stands on a scenic 98-acre tea estate, surrounded by a stunning landscape. Chalets are made out of recycled wooden railway sleepers and rough stone.',
    phone: '+94 57 205 0050',
    email: 'reservations@resort98acres.com',
  ),
  Hotel(
    id: 'cinnamon-bentota',
    name: 'Cinnamon Bentota Beach',
    location: 'Bentota Golden Mile',
    province: 'Southern Province',
    type: 'Luxury Beachfront Resort',
    rating: 4.8,
    reviewCount: 1250,
    pricePerNight: '\$210 / night',
    imageUrl:
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=1200&auto=format&fit=crop',
    amenities: [
      'Direct Beach Access',
      'Multiple Pools',
      'Water Sports Centre',
      'Kids Club',
      'Fine Dining Restaurants',
      'Bawa Lounge',
    ],
    description:
        'Positioned where the Bentota River meets the Indian Ocean, this heritage-inspired luxury resort boasts Geoffrey Bawa-designed batik ceilings, lush lawns, and exceptional water sports.',
    phone: '+94 34 227 5176',
    email: 'bentota@cinnamonhotels.com',
  ),
  Hotel(
    id: 'jetwing-yala',
    name: 'Jetwing Yala',
    location: 'Yala National Park Border',
    province: 'Southern Province',
    type: 'Coastal Safari Eco-Lodge',
    rating: 4.8,
    reviewCount: 890,
    pricePerNight: '\$260 / night',
    imageUrl:
        'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=1200&auto=format&fit=crop',
    amenities: [
      'Huge Saltwater Pool',
      'Dune Dining',
      'Naturalist Guides',
      'Direct Beach & Wild Access',
      'Solar Powered Eco Resort',
    ],
    description:
        'Seamlessly integrated into the coastal wilderness right outside Yala National Park. Experience the thrill of wild boar and elephants passing near the outdoor dining pavilions.',
    phone: '+94 47 471 0710',
    email: 'resv.yala@jetwinghotels.com',
  ),
  Hotel(
    id: 'grand-hotel-nuwara-eliya',
    name: 'The Grand Hotel',
    location: 'Nuwara Eliya',
    province: 'Central Province',
    type: 'Heritage Colonial Hotel',
    rating: 4.8,
    reviewCount: 1600,
    pricePerNight: '\$190 / night',
    imageUrl:
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791?q=80&w=1200&auto=format&fit=crop',
    amenities: [
      'Victorian High Tea',
      'Heated Indoor Pool',
      'Award-winning Gardens',
      'Billiards Room',
      'Indian & Thai Fine Dining',
    ],
    description:
        'The former residence of Sir Edward Barnes (Governor of Ceylon 1830-1850). Known for its manicured English rose gardens, open fireplaces, and world-renowned afternoon high tea.',
    phone: '+94 52 222 2881',
    email: 'info@thegrandhotel.lk',
  ),
  Hotel(
    id: 'fort-bazaar',
    name: 'The Fort Bazaar',
    location: 'Galle Dutch Fort',
    province: 'Southern Province',
    type: 'Boutique Heritage Villa',
    rating: 4.9,
    reviewCount: 710,
    pricePerNight: '\$220 / night',
    imageUrl:
        'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?q=80&w=1200&auto=format&fit=crop',
    amenities: [
      'Colonial Courtyard Cafe',
      'Z Spa',
      'Private Cinema Room',
      'Boutique Suites',
      'Concierge Tours',
    ],
    description:
        'A restored 17th-century merchant home in the heart of Galle Fort with breezy central courtyards, Moorish architecture, and fresh modern design accents.',
    phone: '+94 91 223 2038',
    email: 'reservations@teardrop-hotels.com',
  ),
];

// --- TRANSPORT GUIDE ITEMS ---
class TransportGuideItem {
  final String title;
  final String type;
  final String description;
  final String tips;
  final String costEstimate;
  final String icon;

  const TransportGuideItem({
    required this.title,
    required this.type,
    required this.description,
    required this.tips,
    required this.costEstimate,
    required this.icon,
  });
}

const List<TransportGuideItem> transportGuides = [
  TransportGuideItem(
    title: 'Iconic Mountain Trains (Kandy - Ella)',
    type: 'Scenic Train',
    description:
        'Known as one of the most scenic train journeys in the world. The blue train snakes through cloud forests, verdant tea plantations, and across colonial stone viaducts including the Nine Arch Bridge.',
    tips:
        'Book 1st Class Observation Saloon or 2nd Class Reserved seats at least 30 days in advance via Sri Lanka Railways online portal. 2nd and 3rd class unreserved have open doors perfect for photography.',
    costEstimate: '\$4 - \$15 USD (LKR 1,200 - 4,500)',
    icon: 'train',
  ),
  TransportGuideItem(
    title: 'Private Chauffeur Guide with AC Car / Van',
    type: 'Private Road Transport',
    description:
        'The most popular and stress-free way to explore the island. Licensed English-speaking chauffeur-guides double as cultural interpreters and navigate winding mountain roads safely.',
    tips:
        'Ensure your driver holds an official SLTDA (Sri Lanka Tourism Development Authority) license. Fuel, driver accommodation, and highway tolls are typically included.',
    costEstimate: '\$55 - \$85 USD / day (all inclusive)',
    icon: 'car',
  ),
  TransportGuideItem(
    title: 'Tuk-Tuk (Three-Wheeler)',
    type: 'Local City & Village Transit',
    description:
        'The quintessential Sri Lankan transit method. Perfect for short trips around towns, visiting beaches, and navigating narrow alleys inside Galle Fort or Kandy hills.',
    tips:
        'In Colombo and major cities, always ask for "Meter Tuk-Tuk" or use PickMe/Uber app to guarantee fixed fair pricing. In rural beach towns, agree on price before boarding.',
    costEstimate: 'LKR 100 - 150 per kilometer (~ \$0.35 - \$0.50 USD)',
    icon: 'electric_rickshaw',
  ),
  TransportGuideItem(
    title: 'PickMe & Uber Ride Hailing Apps',
    type: 'Mobile Apps',
    description:
        'PickMe is Sri Lanka\'s premier home-grown ride-hailing app, operating alongside Uber. Covers Tuk-Tuks, Compact Cars, Sedans, and delivery in Colombo, Kandy, Galle, and Negombo.',
    tips:
        'Download the PickMe app upon arrival at the airport using your local SIM. It provides upfront transparent fares and accepts both Cash and International Credit Cards.',
    costEstimate: 'Fixed app rates with zero bargaining needed',
    icon: 'phone_android',
  ),
  TransportGuideItem(
    title: 'Expressway Highway Bus Network',
    type: 'Intercity Public Transport',
    description:
        'Modern air-conditioned buses operating on the Southern Expressway (E01) connecting Colombo to Galle/Matara in under 90 minutes, and the Central Expressway to Kurunegala.',
    tips:
        'Board at Makumbura Multimodal Center or Pettah Central Bus Stand. Clean, rapid, and frequent departures every 15-20 minutes.',
    costEstimate: 'LKR 800 - 1,400 (~ \$2.50 - \$4.50 USD)',
    icon: 'directions_bus',
  ),
];

// --- TRAVEL TIPS DATASET ---
class TravelTipCategory {
  final String title;
  final String subtitle;
  final String icon;
  final List<String> tips;

  const TravelTipCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tips,
  });
}

const List<TravelTipCategory> travelTipsData = [
  TravelTipCategory(
    title: 'Visa & Entry Regulations',
    subtitle: 'Electronic Travel Authorization (ETA)',
    icon: 'badge',
    tips: [
      'All travelers must apply for a tourist visa online via official portal (eta.gov.lk) before arrival.',
      'A standard tourist visa is valid for 30 days from date of entry with double-entry privileges.',
      'Passport must have at least 6 months validity from arrival date and 2 blank pages.',
      'Several nationalities currently enjoy visa-free entry schemes—check latest embassy guidelines.',
    ],
  ),
  TravelTipCategory(
    title: 'Currency & Banking',
    subtitle: 'Sri Lankan Rupee (LKR)',
    icon: 'payments',
    tips: [
      'Official currency is Sri Lankan Rupee (LKR). Exchange rates fluctuate around 300 LKR per 1 USD.',
      'Commercial Bank, Hatton National Bank (HNB), and Sampath Bank ATMs accept foreign Visa and Mastercard.',
      'Credit cards are widely accepted at hotels, restaurants, and supermarkets. Carry cash for Tuk-Tuks, roadside king coconut vendors, and village stalls.',
      'Tipping is customary: 10% service charge is often added to restaurant bills, but LKR 500-1000 for porters and drivers is appreciated.',
    ],
  ),
  TravelTipCategory(
    title: 'Connectivity & SIM Cards',
    subtitle: 'Dialog & Mobitel 4G/5G',
    icon: 'wifi',
    tips: [
      'Buy a Tourist SIM card at Bandaranaike Airport (CMB) arrivals hall. Dialog and Mobitel offer the best countrywide coverage.',
      'Tourist SIM packages typically cost \$10 - \$15 USD for 30GB - 50GB high-speed data and local call minutes.',
      'eSIM options from Airalo and Holafly work seamlessly on Dialog network without swapping physical cards.',
    ],
  ),
  TravelTipCategory(
    title: 'Weather & Monsoon Seasons',
    subtitle: 'A Year-Round Destination',
    icon: 'wb_sunny',
    tips: [
      'South-West Monsoon (Yala): May to September brings rain to the West and South coasts (Colombo, Galle, Bentota). Best time to visit the East coast (Arugam Bay, Trincomalee, Passikudah).',
      'North-East Monsoon (Maha): October to January brings rain to the North and East. Best time to visit the West and South coasts (Mirissa, Unawatuna, Yala).',
      'Hill Country (Nuwara Eliya, Ella) can be cool (12°C - 18°C) at night—pack a light fleece or warm jacket.',
    ],
  ),
  TravelTipCategory(
    title: 'Temple & Cultural Etiquette',
    subtitle: 'Respecting Sacred Traditions',
    icon: 'temple_buddhist',
    tips: [
      'Dress code for Buddhist and Hindu temples: shoulders and knees must be fully covered (white attire is preferred and traditional).',
      'Remove hats and shoes before stepping onto sacred temple grounds.',
      'Never take selfies with your back turned directly towards a Buddha statue—this is considered deeply disrespectful.',
      'Do not touch or pat Buddhist monks on the head or children on the head.',
    ],
  ),
  TravelTipCategory(
    title: 'Emergency Numbers & Tourist Police',
    subtitle: '24/7 Islandwide Assistance',
    icon: 'emergency',
    tips: [
      'Tourist Police Hotline: 1912 (Dedicated English/multilingual tourist assistance).',
      'Police Emergency: 119.',
      'Suwa Seriya Free Islandwide Ambulance: 1990 (Equipped with trained paramedics and GPS dispatch).',
      'Fire & Rescue: 110.',
      'Always drink filtered or bottled mineral water with sealed caps.',
    ],
  ),
];

// --- CULTURAL EVENTS & FESTIVALS ---
class CulturalEvent {
  final String title;
  final String month;
  final String location;
  final String description;
  final String significance;
  final String tip;
  final String imageUrl;

  const CulturalEvent({
    required this.title,
    required this.month,
    required this.location,
    required this.description,
    required this.significance,
    required this.tip,
    required this.imageUrl,
  });
}

const List<CulturalEvent> culturalEvents = [
  CulturalEvent(
    title: 'Kandy Esala Perahera',
    month: 'July / August (10 Days)',
    location: 'Kandy City, Central Province',
    description:
        'One of the oldest and grandest Buddhist festivals in the world. Features a magnificent nightly procession of over 50 caparisoned tuskers, hundreds of traditional Kandyan drummers, fire-dancers, and whip-crackers parading the sacred tooth relic casket.',
    significance:
        'Homage to the Sacred Tooth Relic of the Buddha and prayer for abundant seasonal rains.',
    tip:
        'Book balcony viewing seats months in advance. Hotels in Kandy fill up completely during the final 5 Randoli Perahera nights.',
    imageUrl:
        'https://images.unsplash.com/photo-1586861635167-e5223aadc9fe?q=80&w=1200&auto=format&fit=crop',
  ),
  CulturalEvent(
    title: 'Vesak Festival of Lights',
    month: 'May (Full Moon Poya)',
    location: 'Islandwide (Grandest in Colombo & Kandy)',
    description:
        'The most sacred Buddhist festival commemorating the Birth, Enlightenment, and Passing (Parinirvana) of Gautama Buddha. The entire island is transformed with giant intricate paper lanterns, illuminated pandols (thorana) depicting Jataka tales, and free food stalls (Dansals).',
    significance:
        'The pinnacle of Buddhist celebration and boundless charity.',
    tip:
        'Walk through Bauddhaloka Mawatha and Beira Lake in Colombo at night to sample free street food at community Dansals.',
    imageUrl:
        'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=1200&auto=format&fit=crop',
  ),
  CulturalEvent(
    title: 'Sinhala & Tamil New Year (Aluth Avurudda)',
    month: 'April 13th & 14th',
    location: 'Every home & village islandwide',
    description:
        'The traditional solar new year celebration marking the sun moving from Pisces to Aries. Families celebrate auspicious moments synchronously with firecrackers, boiling milk in new clay pots, traditional sweetmeats (Kevum, Kokis), and village games.',
    significance:
        'Harvest Thanksgiving, family reconciliation, and renewal of cultural bonds.',
    tip:
        'Most commercial shops and banks close for 3 days. Resort hotels stage delightful village game celebrations for guests.',
    imageUrl:
        'https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=1200&auto=format&fit=crop',
  ),
  CulturalEvent(
    title: 'Kataragama Esala Festival',
    month: 'July / August',
    location: 'Kataragama Sacred City, Southern Province',
    description:
        'A sacred multi-faith pilgrimage bringing together Buddhists, Hindus, Muslims, and indigenous Vedda communities. Renowned for miraculous fire-walking rituals (Theemithi) where devotees walk barefoot across glowing red-hot embers.',
    significance:
        'Devotion to God Kataragama (Lord Murugan / Skanda).',
    tip:
        'Witness the solemn Pada Yatra pilgrims who walk hundreds of kilometers barefoot from Jaffna down the east coast to Kataragama.',
    imageUrl:
        'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=1200&auto=format&fit=crop',
  ),
  CulturalEvent(
    title: 'Galle Literary Festival',
    month: 'January / February',
    location: 'Galle Dutch Fort',
    description:
        'An internationally acclaimed literary festival hosting Booker Prize-winning authors, poets, culinary icons, and musicians in intimate colonial fort settings and historic church courtyards.',
    significance:
        'Celebration of international and South Asian literature, arts, and culinary excellence.',
    tip:
        'Combine literary panel discussions with boutique evening dining inside the fort.',
    imageUrl:
        'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?q=80&w=1200&auto=format&fit=crop',
  ),
];
