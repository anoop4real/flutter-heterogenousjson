import 'searchListItem.dart';

class Article extends SearchListItem {
  final String id;
  final String type;
  final String name;
  final String author;
  final int rating;

  Article({
    required this.id,
    required this.type,
    required this.name,
    required this.author,
    required this.rating,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      rating: json['rating'],
      author: json['author'],
    );
  }
}