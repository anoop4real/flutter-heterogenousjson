import '../models/series.dart';
import 'searchlist_item_viewmodel.dart';

class SeriesViewModel extends SearchListItemViewModel {
  late String id;
  late String type;
  late String name;
  late String director;
  late String length;
  late String rating;
  late String season;
  late String episode;

  SeriesViewModel(Series series) {
    id = series.id;
    type = series.type;
    name = series.name;
    director = series.director;
    length = series.length;
    rating = series.rating.toString();
    season = series.season.toString();
    episode = series.episode.toString();
  }
}
