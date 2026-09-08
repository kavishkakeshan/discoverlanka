import 'package:discoverlanka/data/blog_data.dart';
import 'package:discoverlanka/data/destinations_data.dart';
import 'package:discoverlanka/data/tours_data.dart';
import 'package:discoverlanka/data/travel_guide_data.dart';
import 'package:discoverlanka/models/destination_model.dart';
import 'package:discoverlanka/models/tour_package_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiscoverLanka Data & Models Integrity Tests', () {
    test('Destinations dataset contains all curated destinations with valid fields', () {
      expect(allDestinations.length, greaterThanOrEqualTo(18));
      for (final destination in allDestinations) {
        expect(destination.id, isNotEmpty);
        expect(destination.title, isNotEmpty);
        expect(destination.province, isNotEmpty);
        expect(destination.description, isNotEmpty);
        expect(destination.highlights, isNotEmpty);
        expect(destination.activities, isNotEmpty);
        expect(destination.imageUrl, startsWith('http'));
        expect(destination.rating, inInclusiveRange(4.0, 5.0));
      }
    });

    test('Destination categories are well-defined', () {
      expect(destinationCategories, contains('All'));
      expect(destinationCategories, contains('Cultural & Ancient'));
      expect(destinationCategories, contains('Wildlife & Nature'));
      expect(destinationCategories, contains('Beaches & Surf'));
      expect(destinationCategories, contains('Hill Country'));
      expect(destinationCategories, contains('Adventure'));
    });

    test('Tour packages have valid day-by-day itineraries', () {
      expect(allTourPackages.length, greaterThanOrEqualTo(6));
      for (final tour in allTourPackages) {
        expect(tour.id, isNotEmpty);
        expect(tour.title, isNotEmpty);
        expect(tour.duration, isNotEmpty);
        expect(tour.price, greaterThan(0));
        expect(tour.itinerary, isNotEmpty);
        expect(tour.includedItems, isNotEmpty);
        expect(tour.excludedItems, isNotEmpty);
        for (final day in tour.itinerary) {
          expect(day.dayNumber, greaterThanOrEqualTo(1));
          expect(day.title, isNotEmpty);
          expect(day.description, isNotEmpty);
        }
      }
    });

    test('Hotels dataset contains valid properties and contact info', () {
      expect(allHotels.length, greaterThanOrEqualTo(6));
      for (final hotel in allHotels) {
        expect(hotel.id, isNotEmpty);
        expect(hotel.name, isNotEmpty);
        expect(hotel.location, isNotEmpty);
        expect(hotel.type, isNotEmpty);
        expect(hotel.amenities, isNotEmpty);
        expect(hotel.pricePerNight, isNotEmpty);
      }
    });

    test('Transport guides, travel tips, and cultural events are populated', () {
      expect(transportGuides.length, greaterThanOrEqualTo(5));
      expect(travelTipsData.length, greaterThanOrEqualTo(6));
      expect(culturalEvents.length, greaterThanOrEqualTo(5));
    });

    test('Blog posts contain comprehensive travel guides', () {
      expect(allBlogPosts.length, greaterThanOrEqualTo(5));
      for (final post in allBlogPosts) {
        expect(post.id, isNotEmpty);
        expect(post.title, isNotEmpty);
        expect(post.author, isNotEmpty);
        expect(post.readTime, isNotEmpty);
        expect(post.content, isNotEmpty);
        expect(post.tags, isNotEmpty);
      }
    });
  });

  group('DiscoverLanka UI Widget Smoke Tests', () {
    testWidgets('Renders destination info card properly', (WidgetTester tester) async {
      final sampleDestination = allDestinations.first;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Card(
              child: Column(
                children: [
                  Text(sampleDestination.title),
                  Text(sampleDestination.province),
                  Text(sampleDestination.bestTimeToVisit),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text(sampleDestination.title), findsOneWidget);
      expect(find.text(sampleDestination.province), findsOneWidget);
      expect(find.text(sampleDestination.bestTimeToVisit), findsOneWidget);
    });

    testWidgets('Renders tour package overview card properly', (WidgetTester tester) async {
      final sampleTour = allTourPackages.first;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Card(
              child: Column(
                children: [
                  Text(sampleTour.title),
                  Text(sampleTour.duration),
                  Text('\$${sampleTour.price.toInt()}'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text(sampleTour.title), findsOneWidget);
      expect(find.text(sampleTour.duration), findsOneWidget);
      expect(find.text('\$${sampleTour.price.toInt()}'), findsOneWidget);
    });
  });
}
