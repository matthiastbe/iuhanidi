class Apartment {
  final String title;
  final String description;
  final String imageUrl;
  final int capacity;
  final double price;

  Apartment({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.capacity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': description,
      'status': 'publish',
      'featured_media_url': imageUrl,
      'meta': {
        'capacity': capacity,
        'price': price,
      },
    };
  }
}
