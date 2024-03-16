import '../models/article.dart';
import 'searchlist_item_viewmodel.dart';

class ArticleViewModel extends SearchListItemViewModel {
  late String id;
  late String type;
  late String name;
  late String author;
  late String rating;

  ArticleViewModel(Article article) {
    id = article.id;
    type = article.type;
    name = article.name;
    author = article.author;
    rating = article.rating.toString();
  }
}
