import '../models/tour_package_model.dart';

const List<TourPackage> allTourPackages = [
  TourPackage(
    id: 'classic-sri-lanka-7d',
    title: 'Classic Sri Lanka: Culture, Tea & Coast',
    duration: '7 Days / 6 Nights',
    price: 749.0,
    rating: 4.9,
    reviewCount: 342,
    coverImage:
        'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=1200&auto=format&fit=crop',
    difficulty: 'Easy to Moderate',
    groupSize: '2 - 10 Travelers',
    startLocation: 'Bandaranaike International Airport (CMB)',
    overview:
        'The quintessential introduction to the Wonder of Asia. Experience ancient UNESCO royal kingdoms, scale the monumental Sigiriya Rock, journey aboard the iconic blue highland train through rolling tea hills, and unwind on the golden beaches of Galle and Mirissa.',
    itinerary: [
      TourDay(
        dayNumber: 1,
        title: 'Arrival & Negombo Coastal Warmup',
        description:
            'Airport pickup and transfer to the seaside town of Negombo. Unwind after your flight with a welcome coconut drink, stroll along the golden sands, and enjoy a fresh lagoon prawn dinner.',
        activities: [
          'Airport greeting by private chauffeur guide',
          'Lagoon boat cruise through Dutch canals',
          'Welcome seafood dinner by the ocean',
        ],
        stay: 'Jetwing Blue, Negombo',
      ),
      TourDay(
        dayNumber: 2,
        title: 'Cultural Triangle & Sigiriya Sunset',
        description:
            'Head into the Cultural Triangle. Stop by the historic Dambulla Royal Cave Temple before checking in near Sigiriya. In the late afternoon, climb neighboring Pidurangala Rock for an unforgettable sunset view of Sigiriya Fortress.',
        activities: [
          'Explore Dambulla Rock Cave Temple',
          'Traditional Sri Lankan curry lunch in a village hut',
          'Pidurangala Rock sunset hike',
        ],
        stay: 'Aliya Resort & Spa, Sigiriya',
      ),
      TourDay(
        dayNumber: 3,
        title: 'Sigiriya Lion Rock & Royal Kandy',
        description:
            'Climb the 1,200 steps to the summit of King Kashyapa\'s 5th-century fortress in the morning cool. Afterward, journey south toward the hill capital of Kandy, visiting a lush spice garden on route.',
        activities: [
          'Ascend Sigiriya Lion Rock Fortress & Frescoes',
          'Spice garden walking tour in Matale',
          'Evening puja ceremony at Temple of the Sacred Tooth Relic',
        ],
        stay: 'Earl\'s Regency, Kandy',
      ),
      TourDay(
        dayNumber: 4,
        title: 'The Blue Highland Train to Ella',
        description:
            'Board the legendary blue train from Kandy to Ella—voted one of the most scenic railway journeys on Earth. Glide through emerald tea plantations, dramatic waterfalls, and misty mountain viaducts.',
        activities: [
          'Scenic 1st/2nd class reserved train ride',
          'Cross the world-famous Demodara Nine Arch Bridge',
          'Sunset viewpoint at Little Adam\'s Peak',
        ],
        stay: '98 Acres Resort & Spa, Ella',
      ),
      TourDay(
        dayNumber: 5,
        title: 'Ella Tea Estates to Yala Safari',
        description:
            'Visit an operational Ceylon tea factory in the morning to learn the art of orthodox black tea plucking and grading. Descend from the highlands to the southern plains for an afternoon wildlife safari in Yala National Park.',
        activities: [
          'Ceylon Tea tasting & factory tour',
          'View Ravana Falls cascade',
          'Afternoon 4x4 open-top leopard safari in Yala',
        ],
        stay: 'Cinnamon Wild, Yala',
      ),
      TourDay(
        dayNumber: 6,
        title: 'Mirissa Coast & Historic Galle Fort',
        description:
            'Travel along the scenic southern coastline. Witness traditional stilt fishermen perched over the surf. Explore the cobbled alleys, boutique shops, and ramparts of the 17th-century Galle Dutch Fort.',
        activities: [
          'Observation of traditional Weligama stilt fishermen',
          'Guided walking tour of UNESCO Galle Dutch Fort',
          'Sunset cocktails on the Galle lighthouse ramparts',
        ],
        stay: 'The Fort Printers, Galle',
      ),
      TourDay(
        dayNumber: 7,
        title: 'Colombo City Tour & Departure',
        description:
            'Drive to Colombo via the Southern Expressway. Enjoy a brief highlights tour of the capital city—Independence Memorial Hall, Gangaramaya Temple, and Old Parliament—before transfer to the airport.',
        activities: [
          'Colombo city architecture & shopping tour',
          'Souvenir shopping at Barefoot and Laksala',
          'Airport drop-off for flight departure',
        ],
        stay: 'Departure',
      ),
    ],
    includedItems: [
      '6 Nights accommodation in handpicked 4-star & boutique hotels',
      'Daily international buffet breakfast & 3 dinners',
      'Private air-conditioned vehicle with English-speaking licensed guide',
      'Reserved tickets for the scenic Kandy to Ella blue train',
      'All entrance fees (Sigiriya, Dambulla, Tooth Temple, Galle Fort)',
      'Private 4x4 Jeep Safari with tracker in Yala National Park',
      'Bottled mineral water throughout transit',
    ],
    excludedItems: [
      'International airfare & travel insurance',
      'Sri Lanka tourist ETA visa fees',
      'Personal expenses, alcoholic beverages & gratuities',
    ],
  ),

  TourPackage(
    id: 'wildlife-safari-5d',
    title: 'Wildlife & Coastal Safari Odyssey',
    duration: '5 Days / 4 Nights',
    price: 620.0,
    rating: 4.8,
    reviewCount: 198,
    coverImage:
        'https://images.unsplash.com/photo-1584200992694-29ca91aefde6?q=80&w=1200&auto=format&fit=crop',
    difficulty: 'Easy',
    groupSize: '2 - 8 Travelers',
    startLocation: 'Bandaranaike International Airport (CMB)',
    overview:
        'Immerse yourself in Sri Lanka\'s richest wilderness frontiers. Encounter massive herds of Asian elephants in Udawalawe, track elusive leopards and sloth bears in Yala, and embark into deep waters off Mirissa to witness majestic Blue Whales.',
    itinerary: [
      TourDay(
        dayNumber: 1,
        title: 'Negombo to Udawalawe Elephant Sanctuary',
        description:
            'Depart toward Udawalawe National Park. Attend the midday milk-feeding session at the Elephant Transit Home, then embark on an afternoon 4x4 open-air game drive across the savannah grasslands.',
        activities: [
          'Visit Elephant Transit Home orphan rehabilitation center',
          'Private 4x4 game safari among elephant herds',
        ],
        stay: 'Grand Udawalawe Safari Resort',
      ),
      TourDay(
        dayNumber: 2,
        title: 'Udawalawe to Yala Leopard Territory',
        description:
            'Drive to the borders of Yala National Park. Enjoy an evening wilderness game drive tracking leopards, spotted deer, wild boar, and mugger crocodiles.',
        activities: [
          'Afternoon Yala Block 1 game drive with experienced naturalist',
          'Campfire dinner under the stars',
        ],
        stay: 'Jetwing Yala',
      ),
      TourDay(
        dayNumber: 3,
        title: 'Yala Dawn Safari to Mirissa Beach',
        description:
            'Dawn game drive when predators are most active. Then journey along the southern coast to the idyllic bay of Mirissa.',
        activities: [
          'Sunrise predator tracking in Yala',
          'Relaxation on Mirissa beach & sunset at Coconut Tree Hill',
        ],
        stay: 'Mandara Resort, Mirissa',
      ),
      TourDay(
        dayNumber: 4,
        title: 'Blue Whale Safari & Sea Turtles',
        description:
            'Early morning cruise into the Indian Ocean to observe Blue Whales, Sperm Whales, and pods of Spinner Dolphins. In the afternoon, snorkel with gentle wild green sea turtles at Polhena.',
        activities: [
          'Responsible whale watching catamaran expedition',
          'Snorkeling with wild sea turtles in a natural coral lagoon',
        ],
        stay: 'Mandara Resort, Mirissa',
      ),
      TourDay(
        dayNumber: 5,
        title: 'Galle Fort & Airport Return',
        description:
            'Morning visit to the UNESCO Galle Fort before heading up the expressway to Colombo Airport.',
        activities: [
          'Walking tour of Galle Fort lighthouse & ramparts',
          'Express transfer to CMB Airport for departure',
        ],
        stay: 'Departure',
      ),
    ],
    includedItems: [
      '4 Nights luxury eco-lodge & beachfront hotel stays',
      'Daily breakfast & park picnic snacks',
      'Private 4x4 safari jeeps in Udawalawe & Yala',
      'All wildlife national park entry permits & tracker fees',
      'Whale watching boat tickets with safety equipment',
    ],
    excludedItems: [
      'International flights & visa',
      'Alcoholic drinks & discretionary tips',
    ],
  ),

  TourPackage(
    id: 'tea-trails-highland-4d',
    title: 'Highland Mist & Ceylon Tea Trails',
    duration: '4 Days / 3 Nights',
    price: 450.0,
    rating: 4.9,
    reviewCount: 165,
    coverImage:
        'https://images.unsplash.com/photo-1546708973-b339540b5162?q=80&w=1200&auto=format&fit=crop',
    difficulty: 'Moderate',
    groupSize: '2 - 6 Travelers',
    startLocation: 'Kandy or Colombo',
    overview:
        'Ascend into the misty emerald highlands of Sri Lanka. Hike along picturesque tea plantation trails, discover secret cascading waterfalls, ride the iconic railway over colonial stone bridges, and indulge in refined British colonial high tea.',
    itinerary: [
      TourDay(
        dayNumber: 1,
        title: 'Ascent to Nuwara Eliya "Little England"',
        description:
            'Drive through winding mountain roads framed by dramatic waterfalls like Ramboda Falls. Tour a working tea plantation and relax at Lake Gregory.',
        activities: [
          'Ramboda Falls viewpoint visit',
          'High tea experience at the historic Grand Hotel',
          'Evening boat ride on Lake Gregory',
        ],
        stay: 'The Grand Hotel, Nuwara Eliya',
      ),
      TourDay(
        dayNumber: 2,
        title: 'Horton Plains & World\'s End Trek',
        description:
            'Early dawn hike through Horton Plains National Park to reach World\'s End before morning clouds obscure the view. Continue by scenic train to Ella.',
        activities: [
          '9.5 km trek across Horton Plains & Baker\'s Falls',
          'Afternoon train ride to Ella through mountain tunnels',
        ],
        stay: 'Chillville View Resort, Ella',
      ),
      TourDay(
        dayNumber: 3,
        title: 'Ella Highlights & Nine Arch Bridge',
        description:
            'Hike Little Adam\'s Peak at sunrise, marvel at train crossings over the Nine Arch Bridge, and fly across the tea valleys on the Flying Ravana zipline.',
        activities: [
          'Nine Arch Bridge train photography session',
          'Little Adam\'s Peak panoramic summit hike',
          'Optional Flying Ravana Mega Zipline',
        ],
        stay: 'Chillville View Resort, Ella',
      ),
      TourDay(
        dayNumber: 4,
        title: 'Ravana Falls & Descent to Coast/Airport',
        description:
            'Stop at roaring Ravana Falls before your private transfer back to Colombo or southern beach destinations.',
        activities: [
          'Ravana Falls photo stop',
          'Scenic highway journey with lunch stop',
        ],
        stay: 'Departure',
      ),
    ],
    includedItems: [
      '3 Nights accommodation in boutique mountain lodges',
      'Daily breakfast & afternoon high tea',
      'Horton Plains park permit & certified trek guide',
      'Scenic train tickets',
    ],
    excludedItems: [
      'Personal gear & tips',
      'Optional adventure activities (ziplining)',
    ],
  ),

  TourPackage(
    id: 'cultural-heritage-6d',
    title: 'Cultural Heritage & Ancient Kingdoms',
    duration: '6 Days / 5 Nights',
    price: 680.0,
    rating: 4.8,
    reviewCount: 220,
    coverImage:
        'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=1200&auto=format&fit=crop',
    difficulty: 'Easy to Moderate',
    groupSize: '2 - 12 Travelers',
    startLocation: 'Colombo (CMB)',
    overview:
        'Step 2,500 years back into time. Explore the monumental Buddhist monuments of Anuradhapura, the stone sculptures of Polonnaruwa, the soaring fortress of Sigiriya, the cave paintings of Dambulla, and the regal tooth relic shrine of Kandy.',
    itinerary: [
      TourDay(
        dayNumber: 1,
        title: 'Colombo to Sacred Anuradhapura',
        description:
            'Journey north to Sri Lanka\'s oldest documented ancient kingdom. Visit the sacred Jaya Sri Maha Bodhi tree and colossal Ruwanwelisaya dagoba.',
        activities: [
          'Cycling tour through sacred monastery ruins',
          'Evening candle lighting at Ruwanwelisaya',
        ],
        stay: 'The Heritage Hotel, Anuradhapura',
      ),
      TourDay(
        dayNumber: 2,
        title: 'Mihintale & Medieval Polonnaruwa',
        description:
            'Climb the granite staircase of Mihintale—cradle of Buddhism in Sri Lanka. Proceed to Polonnaruwa to view the monumental Gal Vihara stone Buddhas.',
        activities: [
          'Mihintale sacred mountain exploration',
          'Gal Vihara rock-cut sculptures & Royal Palace ruins',
        ],
        stay: 'Deer Park Hotel, Giritale',
      ),
      TourDay(
        dayNumber: 3,
        title: 'Sigiriya Lion Rock & Village Safari',
        description:
            'Morning climb up Sigiriya Rock. In the afternoon, enjoy an authentic rural bullock-cart ride, catamaran cruise, and traditional home-cooked lunch in Hiriwadunna.',
        activities: [
          'Sigiriya Rock Fortress guided expedition',
          'Traditional Hiriwadunna village safari & cooking demonstration',
        ],
        stay: 'Heritance Kandalama, Dambulla',
      ),
      TourDay(
        dayNumber: 4,
        title: 'Dambulla Caves & Royal City of Kandy',
        description:
            'Explore the 5 Dambulla rock caves adorned with 153 statues. Continue to Kandy, visiting a lush herbal spice garden on route.',
        activities: [
          'Dambulla Golden Cave Temple tour',
          'Kandy lake evening stroll & Tooth Relic Temple ceremony',
        ],
        stay: 'Grand Kandyan Hotel, Kandy',
      ),
      TourDay(
        dayNumber: 5,
        title: 'Kandy Royal Botanic Gardens & Arts',
        description:
            'Walk under giant Javanese fig trees and orchid houses in Peradeniya Royal Botanic Gardens. Experience a colorful Kandyan cultural dance show with fire-walking.',
        activities: [
          'Peradeniya Botanical Gardens walking tour',
          'Kandyan drummers & fire-walking performance',
        ],
        stay: 'Grand Kandyan Hotel, Kandy',
      ),
      TourDay(
        dayNumber: 6,
        title: 'Pinnawala Elephant Home & Colombo Return',
        description:
            'Watch majestic elephants bathe in the river at Pinnawala on your return drive to Colombo or the airport.',
        activities: [
          'River bathing viewing at Pinnawala Elephant Orphanage',
          'Return to Colombo or Airport',
        ],
        stay: 'Departure',
      ),
    ],
    includedItems: [
      '5 Nights stays at 4-star & luxury heritage hotels',
      'All Cultural Triangle entrance permits & tickets',
      'Dedicated licensed chauffeur guide & private transport',
      'Traditional village safari with home-cooked lunch',
    ],
    excludedItems: [
      'Gratuities & travel insurance',
      'Personal souvenir expenses',
    ],
  ),

  TourPackage(
    id: 'surf-beach-expedition-5d',
    title: 'Tropical Surf, Sun & Coral Reefs',
    duration: '5 Days / 4 Nights',
    price: 520.0,
    rating: 4.7,
    reviewCount: 145,
    coverImage:
        'https://images.unsplash.com/photo-1502680390469-be75c86b636f?q=80&w=1200&auto=format&fit=crop',
    difficulty: 'Easy',
    groupSize: '2 - 8 Travelers',
    startLocation: 'Colombo (CMB)',
    overview:
        'Bask in the tropical warmth of Sri Lanka\'s golden southern coastline. Perfect for sun lovers, surfers, and ocean enthusiasts looking for clean beach breaks, sea turtle encounters, coral reef snorkeling, and vibrant nightlife.',
    itinerary: [
      TourDay(
        dayNumber: 1,
        title: 'Arrival to Bentota Water Sports Bay',
        description:
            'Transfer from airport to the wide golden sand spits of Bentota. Experience thrilling jet-skiing and mangrove river safaris on the Madu River.',
        activities: [
          'Madu River mangrove boat safari with fish therapy',
          'Sunset beach cocktail at Bentota',
        ],
        stay: 'Cinnamon Bentota Beach',
      ),
      TourDay(
        dayNumber: 2,
        title: 'Hikkaduwa Coral Reef & Sea Turtle Hatchery',
        description:
            'Visit the Kosgoda Sea Turtle Conservation Project to release baby hatchlings into the ocean. Snorkel over Hikkaduwa coral sanctuary.',
        activities: [
          'Kosgoda Sea Turtle Hatchery visit',
          'Snorkeling with giant green turtles at Hikkaduwa beach',
        ],
        stay: 'Hikka Tranz by Cinnamon',
      ),
      TourDay(
        dayNumber: 3,
        title: 'Weligama Surf Academy & Sunset Vibes',
        description:
            'Head to Weligama Bay, the premier surf hub in Sri Lanka. Take a 2-hour guided surf lesson on gentle sandy waves, then head to Mirissa for dinner.',
        activities: [
          'Private 2-hour beginner or intermediate surf coaching',
          'Fresh seafood barbecue dinner on Mirissa sand',
        ],
        stay: 'W15 Weligama Beachfront Resort',
      ),
      TourDay(
        dayNumber: 4,
        title: 'Mirissa Blue Whale Cruise & Secret Beach',
        description:
            'Early morning offshore whale watching cruise, followed by a relaxing afternoon at secluded Secret Beach and Coconut Tree Hill.',
        activities: [
          'Whale watching boat cruise',
          'Coconut Tree Hill sunset photography',
        ],
        stay: 'W15 Weligama Beachfront Resort',
      ),
      TourDay(
        dayNumber: 5,
        title: 'Galle Fort Ramparts to Airport',
        description:
            'Stroll through Galle Fort before cruising up the southern expressway back to Colombo.',
        activities: [
          'Galle Dutch Fort heritage walk',
          'Airport transfer via Southern Expressway',
        ],
        stay: 'Departure',
      ),
    ],
    includedItems: [
      '4 Nights premium beachfront hotel accommodation',
      'Daily breakfast',
      'Surf board rental & 1 private coaching session',
      'Madu River boat safari tickets',
      'Whale watching cruise ticket',
    ],
    excludedItems: [
      'Personal surfing apparel',
      'Alcoholic drinks & tips',
    ],
  ),

  TourPackage(
    id: 'ultimate-grand-island-10d',
    title: 'Ultimate Grand Island Explorer',
    duration: '10 Days / 9 Nights',
    price: 1190.0,
    rating: 5.0,
    reviewCount: 410,
    coverImage:
        'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?q=80&w=1200&auto=format&fit=crop',
    difficulty: 'Moderate',
    groupSize: '2 - 10 Travelers',
    startLocation: 'Colombo (CMB)',
    overview:
        'The definitive 10-day expedition across the entire jewel island. Connects ancient UNESCO civilizations, cloud forests, world-class safaris, mist-laden tea estates, scenic trains, and golden beaches into one seamless master journey.',
    itinerary: [
      TourDay(
        dayNumber: 1,
        title: 'Arrival & Negombo Canal Cruiser',
        description:
            'Arrive in Colombo and check in at beachfront Negombo hotel. Relax with a welcome ayurvedic foot massage.',
        activities: ['Airport reception', 'Ayurvedic massage'],
        stay: 'Heritance Negombo',
      ),
      TourDay(
        dayNumber: 2,
        title: 'Anuradhapura Ancient Kingdom',
        description:
            'Discover Sri Lanka\'s oldest capital with its sacred 2,000-year-old Bodhi tree and towering white stupas.',
        activities: ['Anuradhapura heritage tour', 'Ruwanwelisaya visit'],
        stay: 'Ulagalla by Uga Escapes',
      ),
      TourDay(
        dayNumber: 3,
        title: 'Sigiriya Rock & Minneriya Elephants',
        description:
            'Scale Sigiriya Lion Rock in the morning. Witness the world-famous Minneriya Elephant Gathering in the afternoon.',
        activities: [
          'Sigiriya fortress climb',
          'Minneriya 4x4 elephant safari',
        ],
        stay: 'Heritance Kandalama',
      ),
      TourDay(
        dayNumber: 4,
        title: 'Polonnaruwa & Dambulla Caves',
        description:
            'Visit the medieval stone palaces of Polonnaruwa and the rock cave murals of Dambulla.',
        activities: ['Polonnaruwa cycle tour', 'Dambulla cave temple'],
        stay: 'Heritance Kandalama',
      ),
      TourDay(
        dayNumber: 5,
        title: 'Royal Kandy & Tooth Relic Temple',
        description:
            'Travel to Kandy via a spice garden. Attend the evening Tooth Relic ritual and cultural dance performance.',
        activities: ['Kandy Tooth Relic Temple', 'Cultural dance show'],
        stay: 'The Golden Crown Hotel, Kandy',
      ),
      TourDay(
        dayNumber: 6,
        title: 'Nuwara Eliya Tea Country',
        description:
            'Scenic drive through mountains to Nuwara Eliya. Tour an authentic Ceylon tea plantation and factory.',
        activities: ['Tea pluckers workshop', 'Grand Hotel High Tea'],
        stay: 'The Grand Hotel, Nuwara Eliya',
      ),
      TourDay(
        dayNumber: 7,
        title: 'Scenic Blue Train to Ella',
        description:
            'Take the world-famous blue train over Demodara Nine Arch Bridge. Hike Little Adam\'s Peak.',
        activities: ['Scenic railway journey', 'Nine Arch Bridge photography'],
        stay: '98 Acres Resort & Spa, Ella',
      ),
      TourDay(
        dayNumber: 8,
        title: 'Yala National Park Leopard Safari',
        description:
            'Descend to Yala for an thrilling open-top jeep safari tracking leopards, bears, and elephants.',
        activities: ['Yala 4x4 safari with naturalist guide'],
        stay: 'Cinnamon Wild Yala',
      ),
      TourDay(
        dayNumber: 9,
        title: 'Mirissa Coastline & Galle Dutch Fort',
        description:
            'Follow the southern coast past stilt fishermen to Galle Dutch Fort for sunset rampart views and dining.',
        activities: ['Stilt fishermen viewing', 'Galle Fort walking tour'],
        stay: 'Amangalla or Fort Bazaar, Galle',
      ),
      TourDay(
        dayNumber: 10,
        title: 'Colombo City Tour & Departure',
        description:
            'Colombo architectural highlights, souvenir shopping, and evening departure transfer to the airport.',
        activities: ['Colombo city drive', 'Airport drop-off'],
        stay: 'Departure',
      ),
    ],
    includedItems: [
      '9 Nights in luxury 5-star & boutique colonial resorts',
      'All meals specified (Daily breakfast, 5 special dinners)',
      'Dedicated private luxury A/C vehicle & chauffeur naturalist',
      'All entry tickets, train passes, and safari jeeps',
      'Complimentary Sri Lanka local 5G SIM card with data',
    ],
    excludedItems: [
      'International air tickets & visas',
      'Personal alcoholic beverages',
    ],
  ),
];
