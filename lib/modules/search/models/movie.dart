import 'package:flutter_heterogenous_json/modules/search/models/searchListItem.dart';

class Movie extends SearchListItem {
  final String id;
  final String type;
  final String name;
  final String director;
  final String length;
  final int rating;

  Movie({
    required this.id,
    required this.type,
    required this.name,
    required this.director,
    required this.length,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      director: json['director'],
      length: json['length'],
      rating: json['rating'],
    );
  }
}