class TourDay {
  final int dayNumber;
  final String title;
  final String description;
  final List<String> activities;
  final String stay;

  const TourDay({
    required this.dayNumber,
    required this.title,
    required this.description,
    required this.activities,
    required this.stay,
  });
}

class TourPackage {
  final String id;
  final String title;
  final String duration;
  final double price;
  final double rating;
  final int reviewCount;
  final String coverImage;
  final String difficulty;
  final String groupSize;
  final String startLocation;
  final String overview;
  final List<TourDay> itinerary;
  final List<String> includedItems;
  final List<String> excludedItems;

  const TourPackage({
    required this.id,
    required this.title,
    required this.duration,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.coverImage,
    required this.difficulty,
    required this.groupSize,
    required this.startLocation,
    required this.overview,
    required this.itinerary,
    required this.includedItems,
    required this.excludedItems,
  });
}
