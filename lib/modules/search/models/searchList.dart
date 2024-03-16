import 'searchListItem.dart';

class SearchList {
  final List<SearchListItem> items;

  SearchList({required this.items});

  factory SearchList.fromJson(Map<String, dynamic> json) {
    List<dynamic> serachItems = json['items'];
    List<SearchListItem> items = serachItems.map((item) => SearchListItem.fromJson(item)).toList();
    return SearchList(items: items);
  }
}