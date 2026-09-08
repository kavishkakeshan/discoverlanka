class Hotel {
  final String id;
  final String name;
  final String location;
  final String province;
  final String type;
  final double rating;
  final int reviewCount;
  final String pricePerNight;
  final String imageUrl;
  final List<String> amenities;
  final String description;
  final String phone;
  final String email;

  const Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.province,
    required this.type,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.imageUrl,
    required this.amenities,
    required this.description,
    required this.phone,
    required this.email,
  });
}
