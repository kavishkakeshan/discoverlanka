class BlogPost {
  final String id;
  final String title;
  final String author;
  final String authorRole;
  final String date;
  final String readTime;
  final String excerpt;
  final String content;
  final String imageUrl;
  final String category;
  final List<String> tags;

  const BlogPost({
    required this.id,
    required this.title,
    required this.author,
    required this.authorRole,
    required this.date,
    required this.readTime,
    required this.excerpt,
    required this.content,
    required this.imageUrl,
    required this.category,
    required this.tags,
  });
}
