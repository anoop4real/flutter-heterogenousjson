import 'package:flutter_heterogenous_json/modules/search/viewmodels/searchlist_item_viewmodel.dart';
import 'package:flutter_heterogenous_json/modules/search/viewmodels/series_viewmodel.dart';

import '../models/SearchList.dart';
import '../models/article.dart';
import '../models/movie.dart';
import '../models/series.dart';
import 'article_viewmodel.dart';
import 'movies_viewmodel.dart';

class SearchListVM {
  late List<SearchListItemViewModel> items;

  SearchListVM.fromSearchList(SearchList? searchList) {
    items = [];
    var searchListItems = [];
    if (searchList != null) {
      searchListItems = searchList.items;
    }
    for (var searchListItem in searchListItems) {
      if (searchListItem is Movie) {
        items.add(MoviesViewModel(searchListItem));
      } else if (searchListItem is Series) {
        items.add(SeriesViewModel(searchListItem));
      } else if (searchListItem is Article) {
        items.add(ArticleViewModel(searchListItem));
      }
    }
  }
}
