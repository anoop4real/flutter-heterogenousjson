import 'package:flutter_heterogenous_json/modules/search/models/searchListItem.dart';

class Series extends SearchListItem {
  final String id;
  final String type;
  final String name;
  final String director;
  final String length;
  final int rating;
  final int season;
  final int episode;

  Series({
    required this.id,
    required this.type,
    required this.name,
    required this.director,
    required this.length,
    required this.rating,
    required this.season,
    required this.episode,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      director: json['director'],
      length: json['length'],
      rating: json['rating'],
      season: json['season'],
      episode: json['episode'],
    );
  }
}