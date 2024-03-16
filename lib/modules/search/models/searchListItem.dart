// Define the union type as an abstract class
import 'article.dart';
import 'series.dart';

import 'movie.dart';

abstract class SearchListItem {
  const SearchListItem();

  factory SearchListItem.fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    switch (type) {
      case 'Movie':
        return Movie.fromJson(json);
      case 'Series':
        return Series.fromJson(json);
      case 'Article':
        return Article.fromJson(json);
      default:
        throw ArgumentError('Invalid media type: $type');
    }
  }
}
void displayMediaItem(SearchListItem searchListItem) {
  if (searchListItem is Movie) {
    print('Movie: ${searchListItem.name}, Director: ${searchListItem.director}, Rating: ${searchListItem.rating}');
  } else if (searchListItem is Series) {
    print('Series: ${searchListItem.name}, Director: ${searchListItem.director}, Rating: ${searchListItem.rating}, Season: ${searchListItem.season}, Episode: ${searchListItem.episode}');
  } else if (searchListItem is Article) {
    print('Article: ${searchListItem.name}, Author: ${searchListItem.author}, Rating: ${searchListItem.rating}');
  }
}