class Destination {
  final String id;
  final String title;
  final String category;
  final String province;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final List<String> gallery;
  final String description;
  final String bestTimeToVisit;
  final List<String> highlights;
  final List<String> activities;
  final String entryFee;
  final String location;

  const Destination({
    required this.id,
    required this.title,
    required this.category,
    required this.province,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.gallery,
    required this.description,
    required this.bestTimeToVisit,
    required this.highlights,
    required this.activities,
    required this.entryFee,
    required this.location,
  });
}
