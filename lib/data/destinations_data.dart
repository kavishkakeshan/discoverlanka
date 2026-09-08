import '../models/destination_model.dart';

const List<String> destinationCategories = [
  'All',
  'Cultural & Ancient',
  'Wildlife & Nature',
  'Beaches & Surf',
  'Hill Country',
  'Adventure',
];

const List<Destination> allDestinations = [
  // 1. Sigiriya
  Destination(
    id: 'sigiriya',
    title: 'Sigiriya Rock Fortress',
    category: 'Cultural & Ancient',
    province: 'Central Province',
    rating: 4.9,
    reviewCount: 3840,
    imageUrl:
        'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1586861635167-e5223aadc9fe?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Sigiriya (Lion Rock) is an ancient rock fortress and palace ruin built by King Kashyapa in the 5th century CE. Rising 200 meters above the central plains, it features breathtaking frescoes of celestial maidens, the monumental Lion Gate, and the world-renowned landscaped water gardens that are among the oldest in the world.',
    bestTimeToVisit: 'December to April (Dry & Sunny)',
    highlights: [
      'UNESCO World Heritage Site designated in 1982',
      'World-famous 5th-century Sigiriya Frescoes',
      'Colossal sculpted Lion paws framing the summit staircase',
      'Ancient Mirror Wall featuring graffiti poems dating back to the 6th century',
      'Panoramic 360-degree views from the palace summit ruins',
    ],
    activities: [
      'Climbing the 1,200 steps to the summit',
      'Exploring the royal water gardens & boulder gardens',
      'Sunrise hike up neighboring Pidurangala Rock',
      'Visiting the Sigiriya Archaeological Museum',
    ],
    entryFee: '\$36 USD (Foreign Adults) / LKR 120 (Locals)',
    location: 'Matale District, Central Province',
  ),

  // 2. Galle Fort
  Destination(
    id: 'galle-fort',
    title: 'Galle Dutch Fort',
    category: 'Cultural & Ancient',
    province: 'Southern Province',
    rating: 4.8,
    reviewCount: 2950,
    imageUrl:
        'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Founded by the Portuguese in 1588 and extensively fortified by the Dutch during the 17th century, the Galle Fort is the best-preserved European sea fortress in South Asia. Today it is a living heritage community filled with Dutch-colonial mansions, boutique gem jewelers, ocean-view ramparts, and the iconic white lighthouse.',
    bestTimeToVisit: 'November to April',
    highlights: [
      'Walking along the scenic ramparts at sunset',
      'Iconic Galle Lighthouse and Flag Rock bastion',
      'Historic Dutch Reformed Church built in 1755',
      'Chic cafes, artisan gelaterias, and colonial boutique shops',
    ],
    activities: [
      'Sunset rampart walking tour',
      'Shopping for handmade lace and Ceylon blue sapphires',
      'Dining at heritage courtyard bistros',
      'Cliff diving observation at Flag Rock',
    ],
    entryFee: 'Free (Certain museums charge \$5 USD)',
    location: 'Galle, Southern Province',
  ),

  // 3. Temple of the Tooth Kandy
  Destination(
    id: 'kandy-tooth-temple',
    title: 'Temple of the Sacred Tooth Relic',
    category: 'Cultural & Ancient',
    province: 'Central Province',
    rating: 4.8,
    reviewCount: 3120,
    imageUrl:
        'https://images.unsplash.com/photo-1586861635167-e5223aadc9fe?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1586861635167-e5223aadc9fe?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Sri Dalada Maligawa, commonly known as the Temple of the Sacred Tooth Relic, is a revered Buddhist temple in the royal palace complex of the former Kingdom of Kandy. It houses the left canine tooth relic of Gautama Buddha, which has played an active role in local politics since antiquity.',
    bestTimeToVisit: 'Year-round (Especially July/August during Esala Perahera)',
    highlights: [
      'Venerated relic of Gautama Buddha in a golden casket',
      'Elaborate daily Puja ceremonies accompanied by drumming',
      'Royal Palace complex overlooking picturesque Kandy Lake',
      'Golden canopy roof donated in 1987',
    ],
    activities: [
      'Witnessing the evening Thevava ceremony',
      'Strolling around Kandy Lake (Kiri Muhuda)',
      'Exploring the World Buddhist Museum',
      'Experiencing the Kandy Cultural Dance performance',
    ],
    entryFee: 'LKR 2,000 (~ \$7 USD) for Foreign Nationals',
    location: 'Kandy City, Central Province',
  ),

  // 4. Anuradhapura
  Destination(
    id: 'anuradhapura',
    title: 'Sacred City of Anuradhapura',
    category: 'Cultural & Ancient',
    province: 'North Central Province',
    rating: 4.7,
    reviewCount: 2100,
    imageUrl:
        'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'The first ancient capital of Sri Lanka, flourishing for over 1,300 years from the 4th century BCE. Anuradhapura is home to immense stupas (dagobas) rivaling the pyramids of Giza, ancient hydraulic reservoirs, and Jaya Sri Maha Bodhi—the oldest documented living tree planted by humans (288 BCE).',
    bestTimeToVisit: 'May to September & December to February',
    highlights: [
      'Jaya Sri Maha Bodhi sacred fig tree',
      'Ruwanwelisaya colossal white stupa',
      'Jetavanaramaya—once the 3rd tallest structure in the ancient world',
      'Kuttam Pokuna (Twin Ponds) hydraulic engineering masterpiece',
    ],
    activities: [
      'Cycling between sacred ancient monuments',
      'Evening meditation at Ruwanwelisaya',
      'Photography of ancient monolithic Buddha statues',
    ],
    entryFee: '\$30 USD for Cultural Triangle Pass',
    location: 'Anuradhapura, North Central Province',
  ),

  // 5. Polonnaruwa
  Destination(
    id: 'polonnaruwa',
    title: 'Ancient City of Polonnaruwa',
    category: 'Cultural & Ancient',
    province: 'North Central Province',
    rating: 4.8,
    reviewCount: 1840,
    imageUrl:
        'https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1588598198321-9735fd52455b?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'The second ancient capital of Sri Lanka after Anuradhapura, Polonnaruwa features well-preserved ruins of royal palaces, council chambers, and the extraordinary Gal Vihara—a rock temple featuring four colossal Buddha figures carved from a single granite wall.',
    bestTimeToVisit: 'January to April & July to September',
    highlights: [
      'Gal Vihara rock-cut colossal Buddha statues',
      'Royal Palace of King Parakramabahu I with original multi-tier ruins',
      'Vatadage circular relic house with moonstones and guardstones',
      'The vast Parakrama Samudra artificial ocean reservoir',
    ],
    activities: [
      'Bicycle tour through forest-lined ruins',
      'Observing toque macaque monkey colonies (featured by Disney)',
      'Boat cruise on the Parakrama Samudra lake',
    ],
    entryFee: '\$30 USD',
    location: 'Polonnaruwa, North Central Province',
  ),

  // 6. Dambulla Cave Temple
  Destination(
    id: 'dambulla',
    title: 'Dambulla Royal Cave Temple',
    category: 'Cultural & Ancient',
    province: 'Central Province',
    rating: 4.7,
    reviewCount: 2210,
    imageUrl:
        'https://images.unsplash.com/photo-1589182373726-e4f658ab50f0?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1589182373726-e4f658ab50f0?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'The largest and best-preserved cave temple complex in Sri Lanka, spanning five sanctuaries carved under a colossal overhanging rock. It contains 153 Buddha statues, intricate murals covering 2,100 square meters of rock ceiling, and panoramic views of Sigiriya Rock in the distance.',
    bestTimeToVisit: 'Year-round (Best in early morning)',
    highlights: [
      'Five sacred caves with exquisite ceiling paintings',
      'Colossal 14-meter reclining Buddha statue carved in Cave 1',
      'Panoramic view across the Dambulla plains and Sigiriya',
      'Golden Buddha statue and pagoda at the base',
    ],
    activities: [
      'Guided cave architecture and mural tour',
      'Climbing the scenic rock staircase alongside playful monkeys',
      'Witnessing flower offerings at the sacred shrine',
    ],
    entryFee: 'LKR 2,000 (~ \$7 USD)',
    location: 'Dambulla, Central Province',
  ),

  // 7. Yala National Park
  Destination(
    id: 'yala-national-park',
    title: 'Yala National Park',
    category: 'Wildlife & Nature',
    province: 'Southern Province',
    rating: 4.8,
    reviewCount: 4200,
    imageUrl:
        'https://images.unsplash.com/photo-1584200992694-29ca91aefde6?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1584200992694-29ca91aefde6?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1534567153574-2b12153a87f0?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1564769625905-50e93615e769?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Yala National Park is Sri Lanka\'s most famous wildlife reserve, boasting the highest density of leopards (Panthera pardus kotiya) in the world. Encompassing coastal lagoons, scrub jungles, and rocky outcrops, it is also home to herds of Asian elephants, sloth bears, mugger crocodiles, and 215 bird species.',
    bestTimeToVisit: 'February to June (Dry season for top sightings)',
    highlights: [
      'World-highest leopard density in Block 1',
      'Asian elephant herds bathing in natural waterholes',
      'Rare sightings of Sri Lankan Sloth Bears',
      'Dramatic coastal sand dunes and Indian Ocean backdrop',
    ],
    activities: [
      'Early morning 4x4 open-top safari game drives',
      'Sunset wildlife photography tours',
      'Luxury glamping under the stars beside the park border',
    ],
    entryFee: '\$25 USD Park Permit + Jeep Hire (~ \$45-\$60 USD)',
    location: 'Tissamaharama, Southern / Uva Province',
  ),

  // 8. Udawalawe National Park
  Destination(
    id: 'udawalawe',
    title: 'Udawalawe National Park',
    category: 'Wildlife & Nature',
    province: 'Sabaragamuwa Province',
    rating: 4.9,
    reviewCount: 2650,
    imageUrl:
        'https://images.unsplash.com/photo-1534567153574-2b12153a87f0?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1534567153574-2b12153a87f0?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1584200992694-29ca91aefde6?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Created to provide a sanctuary for wild animals displaced by the construction of the Udawalawe Reservoir, this park provides guaranteed elephant sightings throughout the year. Its open grasslands and central water body give it the feel of an East African savannah.',
    bestTimeToVisit: 'October to April',
    highlights: [
      'Over 500 wild Asian elephants living in pristine grasslands',
      'Elephant Transit Home caring for rehabilitated orphan baby calves',
      'Water buffaloes, spotted deer, wild boars, and jackals',
      'Abundant raptors including White-bellied Sea Eagles and Crested Serpent Eagles',
    ],
    activities: [
      'Morning jeep safari with expert naturalists',
      'Visiting the Elephant Transit Home during milk feeding sessions',
      'Bird watching around the Udawalawe reservoir',
    ],
    entryFee: '\$20 USD Park Fee + Jeep Hire',
    location: 'Udawalawe, Sabaragamuwa / Uva',
  ),

  // 9. Sinharaja Forest
  Destination(
    id: 'sinharaja',
    title: 'Sinharaja Rain Forest Reserve',
    category: 'Wildlife & Nature',
    province: 'Sabaragamuwa Province',
    rating: 4.8,
    reviewCount: 1420,
    imageUrl:
        'https://images.unsplash.com/photo-1511497584788-87676104235f?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1511497584788-87676104235f?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1542332213-9b5a5a3fad35?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'A UNESCO World Heritage primary tropical rainforest, Sinharaja is Sri Lanka\'s last viable area of primary tropical rainforest. More than 60% of the trees are endemic and it harbors 95% of the island\'s endemic birds including the Sri Lanka Blue Magpie and Red-faced Malkoha.',
    bestTimeToVisit: 'August to September & January to March',
    highlights: [
      'Last remaining pristine primary virgin rainforest on the island',
      'Legendary mixed-species bird feeding flocks (bird waves)',
      'Hidden forest waterfalls and crystal clear natural swimming pools',
      'Incredible biodiversity of orchids, amphibians, and medicinal herbs',
    ],
    activities: [
      'Trekking with licensed wildlife trackers',
      'Endemic birdwatching expeditions',
      'Dipping in secluded natural rainforest streams',
    ],
    entryFee: 'LKR 2,500 (~ \$8 USD) + Tracker Fee',
    location: 'Kalawana, Sabaragamuwa Province',
  ),

  // 10. Mirissa
  Destination(
    id: 'mirissa',
    title: 'Mirissa Beach & Whale Watching',
    category: 'Beaches & Surf',
    province: 'Southern Province',
    rating: 4.8,
    reviewCount: 4500,
    imageUrl:
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'A picturesque crescent of golden sand fringed by swaying coconut palms, Mirissa is world-famous as one of the best locations on Earth to spot Blue Whales—the largest creatures to ever live. By night, beachfront seafood shacks light up with lanterns, serving catch-of-the-day fish under the stars.',
    bestTimeToVisit: 'November to April (Prime Blue Whale season)',
    highlights: [
      'World-class Blue Whale and Spinner Dolphin marine safaris',
      'Iconic Coconut Tree Hill promontory overlooking the ocean',
      'Secret Beach secluded cove for relaxation and snorkeling',
      'Vibrant beachfront dining with candlelit tables on the sand',
    ],
    activities: [
      'Catamaran or boat whale watching safari',
      'Sunrise photography at Coconut Tree Hill',
      'Surfing on Mirissa right-hand reef break',
      'Snorkeling with wild sea turtles at Polhena Beach',
    ],
    entryFee: 'Free Beach Access; Whale Safari ~ \$40-\$55 USD',
    location: 'Mirissa, Southern Province',
  ),

  // 11. Arugam Bay
  Destination(
    id: 'arugam-bay',
    title: 'Arugam Bay Surf Haven',
    category: 'Beaches & Surf',
    province: 'Eastern Province',
    rating: 4.9,
    reviewCount: 3100,
    imageUrl:
        'https://images.unsplash.com/photo-1502680390469-be75c86b636f?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1502680390469-be75c86b636f?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Ranked among the top 10 surf spots in the world, Arugam Bay is a laid-back moon-shaped bay on the Indian Ocean in Sri Lanka\'s southeast dry zone. It attracts world-class surfers for its long right-hand point break, bohemian beachfront cafes, yoga shalas, and proximity to Kumana National Park.',
    bestTimeToVisit: 'May to September (Eastern surf season)',
    highlights: [
      'Legendary Main Point right-hand wave offering 400m+ rides',
      'Chilled bohemian lifestyle with beach cafes and yoga retreats',
      'Whiskey Point and Peanut Farm surf breaks for all skill levels',
      'Lagoon safari observing crocodiles, wild elephants, and birds',
    ],
    activities: [
      'Surf sessions from beginner to advanced',
      'Sunset hike up Kudumbigala Monastery Rock',
      'Lagoon boat safaris through Pottuvil mangroves',
      'Kumana National Park bird watching game drive',
    ],
    entryFee: 'Free Beach Access',
    location: 'Pottuvil, Eastern Province',
  ),

  // 12. Unawatuna & Galle Coast
  Destination(
    id: 'unawatuna',
    title: 'Unawatuna Beach & Coral Reef',
    category: 'Beaches & Surf',
    province: 'Southern Province',
    rating: 4.7,
    reviewCount: 3600,
    imageUrl:
        'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'A golden horseshoe bay sheltered by a coral reef, Unawatuna offers safe swimming waters, tranquil tropical vibes, and proximity to the historic Galle Fort. Jungle Beach nearby provides an idyllic secluded bay surrounded by lush coastal jungle.',
    bestTimeToVisit: 'December to April',
    highlights: [
      'Calm turquoise waters safe for swimming year-round',
      'Jungle Beach hidden cove with Japanese Peace Pagoda nearby',
      'Rich marine life for beginner scuba divers and snorkelers',
      'Beachside yoga studios, massage spas, and live acoustic music',
    ],
    activities: [
      'Snorkeling over offshore coral reefs',
      'Hiking through the forest to Jungle Beach',
      'Visiting the Japanese Peace Pagoda for sunset views',
      'Scuba diving to historic shipwrecks off the coast',
    ],
    entryFee: 'Free Beach Access',
    location: 'Unawatuna, Southern Province',
  ),

  // 13. Ella & Nine Arch Bridge
  Destination(
    id: 'ella-rock',
    title: 'Ella & The Nine Arch Bridge',
    category: 'Hill Country',
    province: 'Uva Province',
    rating: 4.9,
    reviewCount: 5120,
    imageUrl:
        'https://images.unsplash.com/photo-1546708973-b339540b5162?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1546708973-b339540b5162?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1578632767115-351597cf2477?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Ella is a charming mountain village tucked into the misty highlands of Sri Lanka. Renowned for its cool climate, dramatic mountain passes, terraced tea plantations, and the world-famous Demodara Nine Arch Bridge—an engineering marvel built purely of brick, stone, and cement without any steel during the British colonial era.',
    bestTimeToVisit: 'January to May & July to September',
    highlights: [
      'Iconic Demodara Nine Arch Bridge ("Bridge in the Sky")',
      'Watching the blue highland train cross the bridge',
      'Hikes up Little Adam\'s Peak and demanding Ella Rock',
      'Ravana Falls cascading down 25 meters beside the highway',
    ],
    activities: [
      'Train viewing and photography at Nine Arch Bridge',
      'Sunrise hike up Little Adam\'s Peak',
      'Ziplining across the tea valley on the Flying Ravana',
      'Touring organic Ceylon tea factories with tastings',
    ],
    entryFee: 'Free (Zipline & activities charged separately)',
    location: 'Ella, Badulla District, Uva Province',
  ),

  // 14. Nuwara Eliya
  Destination(
    id: 'nuwara-eliya',
    title: 'Nuwara Eliya "Little England"',
    category: 'Hill Country',
    province: 'Central Province',
    rating: 4.8,
    reviewCount: 3800,
    imageUrl:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1546708973-b339540b5162?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Located at an altitude of 1,868 meters, Nuwara Eliya is the tea capital of Sri Lanka. Known as "Little England" for its cool alpine climate, Tudor-style country houses, manicured British golf courses, and picturesque Gregory Lake surrounded by endless emerald carpets of Ceylon tea estates.',
    bestTimeToVisit: 'February to May (Spring season with blooms)',
    highlights: [
      'Verdant rolling hills of world-famous Ceylon Orange Pekoe tea',
      'Historic 1894 Tudor-style Nuwara Eliya Post Office',
      'Scenic Gregory Lake with boating and horse rides',
      'Victoria Park vibrant flower gardens and birding trails',
    ],
    activities: [
      'High tea at the historic Grand Hotel',
      'Visiting Pedro or Mackwoods Labookellie Tea Estate',
      'Speedboat rides and jet-skiing on Lake Gregory',
      'Walking through Hakgala Botanical Gardens',
    ],
    entryFee: 'Varies by attraction (\$3 - \$10 USD)',
    location: 'Nuwara Eliya, Central Province',
  ),

  // 15. Horton Plains & Worlds End
  Destination(
    id: 'horton-plains',
    title: 'Horton Plains & World\'s End',
    category: 'Hill Country',
    province: 'Central Province',
    rating: 4.8,
    reviewCount: 2900,
    imageUrl:
        'https://images.unsplash.com/photo-1511497584788-87676104235f?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1511497584788-87676104235f?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'A windswept plateau situated 2,100 meters above sea level, Horton Plains is a protected national park of montane grassland and cloud forest. Its crown jewel is World\'s End, a sheer precipice dropping vertically by 870 meters with breathtaking vistas stretching all the way to the southern ocean on clear mornings.',
    bestTimeToVisit: 'January to March (Early morning before clouds roll in)',
    highlights: [
      'World\'s End dramatic 870-meter sheer cliff drop',
      'Baker\'s Falls picturesque 20-meter tiered waterfall',
      'Mini World\'s End second dramatic viewpoint',
      'Herds of Sambar deer grazing in misty moorlands',
    ],
    activities: [
      '9.5 km circular trail trek through cloud forest and grasslands',
      'Dawn photography of misty grasslands and Sambar deer',
      'Bird watching for endemic highland species like the Yellow-eared Bulbul',
    ],
    entryFee: '\$25 USD Park Permit per person + vehicle fee',
    location: 'Ohiya / Nuwara Eliya, Central Province',
  ),

  // 16. Adams Peak / Sri Pada
  Destination(
    id: 'adams-peak',
    title: 'Adam\'s Peak (Sri Pada)',
    category: 'Adventure',
    province: 'Central Province',
    rating: 4.9,
    reviewCount: 3200,
    imageUrl:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1546708973-b339540b5162?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'A sacred 2,243-meter conical mountain towering over the central hills. Revered by Buddhists as the footprint of the Buddha, by Hindus as Lord Shiva, and by Christians and Muslims as the spot where Adam first set foot on Earth. A nighttime pilgrimage of 5,500 illuminated steps leads to an awe-inspiring sunrise and the famous shadow phenomenon.',
    bestTimeToVisit: 'December to May (Pilgrimage season)',
    highlights: [
      'Sacred footprint shrine atop the pyramid summit',
      'Magical triangular shadow cast by the peak onto the clouds at sunrise',
      'Atmospheric nighttime climb with illuminated mountain pathways',
      'Ringing the sacred brass bell at the mountain peak',
    ],
    activities: [
      'Midnight hike to reach the summit for dawn (3-4 hours)',
      'Witnessing the ceremonial drumming at the summit shrine',
      'Sipping hot sweet Ceylon tea at rustic resting stops',
    ],
    entryFee: 'Free (Donations welcome at temples)',
    location: 'Nallathanniya, Central Province',
  ),

  // 17. Knuckles Mountain Range
  Destination(
    id: 'knuckles',
    title: 'Knuckles Mountain Range',
    category: 'Adventure',
    province: 'Central Province',
    rating: 4.8,
    reviewCount: 1650,
    imageUrl:
        'https://images.unsplash.com/photo-1542332213-9b5a5a3fad35?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1542332213-9b5a5a3fad35?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1511497584788-87676104235f?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Named after its resemblance to a clenched fist when viewed from Kandy, the Knuckles Mountain Range is a UNESCO World Heritage wilderness featuring 34 peaks over 900 meters. With secluded cardamom villages, rushing crystal rivers, and cascading hidden waterfalls, it is the ultimate trekking paradise.',
    bestTimeToVisit: 'June to September & December to February',
    highlights: [
      '34 mountain peaks with dramatic cliff edges and cloud forests',
      'Corbett\'s Gap panoramic mountain pass and windy lookout',
      'Meemure—an ancient isolated village preserved in time',
      'Hidden crystal waterfalls like Mini World\'s End Knuckles and Sera Ella',
    ],
    activities: [
      'Multi-day guided wilderness trekking and wild camping',
      'Visiting traditional cardamom and paddy terrace villages',
      'Swimming under pristine mountain waterfalls',
    ],
    entryFee: 'LKR 2,000 (~ \$7 USD) + Guide Fee',
    location: 'Matale / Kandy Districts, Central Province',
  ),

  // 18. Kitulgala
  Destination(
    id: 'kitulgala',
    title: 'Kitulgala White Water Rafting',
    category: 'Adventure',
    province: 'Sabaragamuwa Province',
    rating: 4.7,
    reviewCount: 1980,
    imageUrl:
        'https://images.unsplash.com/photo-1502680390469-be75c86b636f?q=80&w=1200&auto=format&fit=crop',
    gallery: [
      'https://images.unsplash.com/photo-1502680390469-be75c86b636f?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=800&auto=format&fit=crop',
    ],
    description:
        'Set along the roaring Kelani River, Kitulgala is Sri Lanka\'s adventure sports headquarters. Famous as the film location for David Lean\'s Oscar-winning 1957 classic "The Bridge on the River Kwai", it offers thrilling Grade 2 and 3 white water rafting, canyoning, waterfall abseiling, and lush rainforest birding.',
    bestTimeToVisit: 'Year-round (Best water levels May to December)',
    highlights: [
      'Grade 2 and 3 white water rapids along 5 km of the Kelani River',
      'Historic location of "The Bridge on the River Kwai" movie set',
      'Belilena prehistoric cave where 16,000-year-old human fossils were found',
      'Natural water jumps and sliding down granite rock shoots',
    ],
    activities: [
      'White water rafting on the Kelani River',
      'Canyoning and waterfall abseiling',
      'Jungle trekking and prehistoric cave exploration',
    ],
    entryFee: 'Rafting packages from \$25-\$45 USD per person',
    location: 'Kitulgala, Sabaragamuwa Province',
  ),
];
