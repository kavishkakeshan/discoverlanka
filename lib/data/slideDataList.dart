import 'package:discoverlanka/components/booking_modal.dart';
import 'package:discoverlanka/components/popupFunction.dart';
import 'package:flutter/material.dart';

import '../models/slideModel.dart'; // Import the blueprint

final List<Slide> carouselWhyChooseSlides = [
  Slide(
    image: 'https://images.pexels.com/photos/6045035/pexels-photo-6045035.jpeg',
    title: 'Cultural Heritage',
    desc:
        'Explore ancient temples and historic sites that tell tales of a rich civilization.',
  ),
  Slide(
    image:
        'https://images.unsplash.com/photo-1609242030544-f2a37bab739c?q=80&w=1016&auto=format&fit=crop',
    title: 'Wildlife Safari',
    desc:
        'Encounter exotic wildlife in their natural habitat across national parks.',
  ),
  Slide(
    image:
        'https://images.unsplash.com/photo-1505228395891-9a51e7e86bf6?q=80&w=1033&auto=format&fit=crop',
    title: 'Beach Paradise',
    desc:
        'Relax on pristine beaches with crystal clear waters and golden sand.',
  ),
];

final List<Slide> carouselTravelersSlides = [
  Slide(
    icon: Icon(Icons.format_quote, color: Colors.green.shade400, size: 50),
    comment:
        '"Sri Lanka is a breathtaking destination with so much to offer. The people are warm, and the landscapes are stunning!"',
    name: 'Jane Doe',
    ratingIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) =>
            Icon(Icons.star_rounded, color: Colors.amber.shade500, size: 20),
      ),
    ),
  ),
  Slide(
    icon: Icon(Icons.format_quote, color: Colors.green.shade400, size: 50),
    comment:
        '"The wildlife safari was an unforgettable experience. I saw elephants, leopards, and so much more!"',
    name: 'John Smith',
    ratingIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) =>
            Icon(Icons.star_rounded, color: Colors.amber.shade500, size: 20),
      ),
    ),
  ),
  Slide(
    icon: Icon(Icons.format_quote, color: Colors.green.shade400, size: 50),
    comment:
        '"The beaches are paradise. I can\'t wait to go back and explore more of this beautiful island."',
    name: 'Emily Johnson',
    ratingIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) =>
            Icon(Icons.star_rounded, color: Colors.amber.shade500, size: 20),
      ),
    ),
  ),
];

List<Slide> carouselExploreSlides(BuildContext context) => [
  // --- SLIDE 1: Sigiriya Rock Fortress (Already done) ---
  Slide(
    image:
        'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Sigiriya Rock Fortress',
    desc: 'Ancient palace and fortress complex, UNESCO World Heritage Site.',
    location: Row(
      children: [
        Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
        SizedBox(width: 4),
        Text(
          'Central Province, Sri Lanka',
          style: TextStyle(fontSize: 12, color: Colors.greenAccent),
        ),
      ],
    ),
    button: ElevatedButton(
      onPressed: () {
        popupDialog(
          context: context,
          imageUrl:
              'https://images.unsplash.com/photo-1580794749460-76f97b7180d8?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Sigiriya Rock',
          description:
              'Ancient palace and fortress complex, UNESCO World Heritage Site',
          location: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                'Central Province, Sri Lanka',
                style: TextStyle(fontSize: 12, color: Colors.green.shade700),
              ),
            ],
          ),
          onBookPressed: () {
            Navigator.pop(context);
            showBookingModal(
              context: context,
              itemTitle: 'Sigiriya Rock Guided Tour',
              itemCategory: 'Cultural & Ancient',
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
      child: Text(
        'View Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),

  // --- SLIDE 2: Yala Safari Park (Updated) ---
  Slide(
    image:
        'https://images.unsplash.com/photo-1584200992694-29ca91aefde6?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Yala Safari Park',
    desc: 'Experience wildlife in their natural habitat.',
    location: Row(
      children: [
        Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
        SizedBox(width: 4),
        Text(
          'Yala National Park',
          style: TextStyle(fontSize: 12, color: Colors.greenAccent),
        ),
      ],
    ),
    button: ElevatedButton(
      onPressed: () {
        popupDialog(
          context: context,
          imageUrl:
              'https://images.unsplash.com/photo-1584200992694-29ca91aefde6?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Yala Safari Park',
          description: 'Experience wildlife in their natural habitat.',
          location: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                'Yala National Park',
                style: TextStyle(fontSize: 12, color: Colors.green.shade700),
              ),
            ],
          ),
          onBookPressed: () {
            Navigator.pop(context);
            showBookingModal(
              context: context,
              itemTitle: 'Yala National Park Safari',
              itemCategory: 'Wildlife Safari',
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
      child: Text(
        'View Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),

  // --- SLIDE 3: Ancient Buddha Statues (Updated) ---
  Slide(
    image:
        'https://www.lanka-excursions-holidays.com/uploads/4/0/2/1/40216937/8563043_orig.jpg',
    title: 'Ancient Buddha Statues',
    desc: 'Historical Buddhist temple with intricate architecture.',
    location: Row(
      children: [
        Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
        SizedBox(width: 4),
        Text(
          'Anuradhapura',
          style: TextStyle(fontSize: 12, color: Colors.greenAccent),
        ),
      ],
    ),
    button: ElevatedButton(
      onPressed: () {
        popupDialog(
          context: context,
          imageUrl:
              'https://www.lanka-excursions-holidays.com/uploads/4/0/2/1/40216937/8563043_orig.jpg',
          title: 'Ancient Buddha Statues',
          description: 'Historical Buddhist temple with intricate architecture.',
          location: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                'Anuradhapura',
                style: TextStyle(fontSize: 12, color: Colors.green.shade700),
              ),
            ],
          ),
          onBookPressed: () {
            Navigator.pop(context);
            showBookingModal(
              context: context,
              itemTitle: 'Anuradhapura Cultural Heritage Tour',
              itemCategory: 'Ancient Temples',
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
      child: Text(
        'View Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),

  // --- SLIDE 4: Mirissa Beach (Updated) ---
  Slide(
    image:
        'https://images.unsplash.com/photo-1649923113200-732d6fefbb6a?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Mirissa Beach',
    desc:
        'Mirissa, a charming coastal town in southern Sri Lanka, is best visited between November and April when the weather is sunny and dry.',
    location: Row(
      children: [
        Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
        SizedBox(width: 4),
        Text(
          'Southern Province, Sri Lanka',
          style: TextStyle(fontSize: 12, color: Colors.greenAccent),
        ),
      ],
    ),
    button: ElevatedButton(
      onPressed: () {
        popupDialog(
          context: context,
          imageUrl:
              'https://images.unsplash.com/photo-1649923113200-732d6fefbb6a?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Mirissa Beach',
          description:
              'Mirissa, a charming coastal town in southern Sri Lanka, is best visited between November and April when the weather is sunny and dry.',
          location: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                'Southern Province, Sri Lanka',
                style: TextStyle(fontSize: 12, color: Colors.green.shade700),
              ),
            ],
          ),
          onBookPressed: () {
            Navigator.pop(context);
            showBookingModal(
              context: context,
              itemTitle: 'Mirissa Beach & Whale Cruise',
              itemCategory: 'Beach & Marine',
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
      child: Text(
        'View Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),

  // --- SLIDE 5: Arugam Bay Beach (Updated) ---
  Slide(
    image:
        'https://as2.ftcdn.net/v2/jpg/02/17/63/89/1000_F_217638969_rfRP2xj50HvZweJiRct8SWjXmG6OfydM.jpg',
    title: 'Arugam Bay Beach',
    desc:
        'Arugam Bay is a popular surfing location and is also the only international surf competition venue in Sri Lanka.',
    location: Row(
      children: [
        Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
        SizedBox(width: 4),
        Text(
          'Central Province, Sri Lanka',
          style: TextStyle(fontSize: 12, color: Colors.greenAccent),
        ),
      ],
    ),
    button: ElevatedButton(
      onPressed: () {
        popupDialog(
          context: context,
          imageUrl:
              'https://as2.ftcdn.net/v2/jpg/02/17/63/89/1000_F_217638969_rfRP2xj50HvZweJiRct8SWjXmG6OfydM.jpg',
          title: 'Arugam Bay Beach',
          description:
              'Arugam Bay is a popular surfing location and is also the only international surf competition venue in Sri Lanka.',
          location: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                'Central Province, Sri Lanka',
                style: TextStyle(fontSize: 12, color: Colors.green.shade700),
              ),
            ],
          ),
          onBookPressed: () {
            Navigator.pop(context);
            showBookingModal(
              context: context,
              itemTitle: 'Arugam Bay Surf & Lagoon Tour',
              itemCategory: 'Surf & Adventure',
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
      child: Text(
        'View Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),

  // --- SLIDE 6: Nuwara Eliya Tea Estate (Updated) ---
  Slide(
    image:
        'https://media.istockphoto.com/id/579253918/photo/female-worker-in-tea-plantations-of-sri-lanka.jpg?s=612x612&w=is&k=20&c=DYdwCo1tCio7jBUoXkcLxH90IMyFVYHPljdo3r5JBqw=',
    title: 'Nuwara Eliya Tea Estate',
    desc:
        'Nuwara Eliya is a city in the hill country of the Central Province, Sri Lanka. Its name means \'city on the plain (table land)\' or \'city of light\'.',
    location: Row(
      children: [
        Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
        SizedBox(width: 4),
        Text(
          'Central Province, Sri Lanka',
          style: TextStyle(fontSize: 12, color: Colors.greenAccent),
        ),
      ],
    ),
    button: ElevatedButton(
      onPressed: () {
        popupDialog(
          context: context,
          imageUrl:
              'https://media.istockphoto.com/id/579253918/photo/female-worker-in-tea-plantations-of-sri-lanka.jpg?s=612x612&w=is&k=20&c=DYdwCo1tCio7jBUoXkcLxH90IMyFVYHPljdo3r5JBqw=',
          title: 'Nuwara Eliya Tea Estate',
          description:
              'Nuwara Eliya is a city in the hill country of the Central Province, Sri Lanka. Its name means \'city on the plain (table land)\' or \'city of light\'.',
          location: Row(
            children: [
              Icon(Icons.location_on, color: Colors.red.shade400, size: 16),
              SizedBox(width: 4),
              Text(
                'Central Province, Sri Lanka',
                style: TextStyle(fontSize: 12, color: Colors.green.shade700),
              ),
            ],
          ),
          onBookPressed: () {
            Navigator.pop(context);
            showBookingModal(
              context: context,
              itemTitle: 'Ceylon Tea Plantation Tour',
              itemCategory: 'Highland Tour',
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
      child: Text(
        'View Details',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),
];
