import '../models/movie.dart';
import 'searchlist_item_viewmodel.dart';

class MoviesViewModel extends SearchListItemViewModel {
  late String id;
  late String type;
  late String name;
  late String director;
  late String length;
  late String rating;

  MoviesViewModel(Movie movie) {
    id = movie.id;
    type = movie.type;
    name = movie.name;
    director = movie.director;
    length = movie.length;
    rating = movie.rating.toString();
  }
}
