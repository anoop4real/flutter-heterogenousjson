import 'package:flutter/cupertino.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../../../core/helpers/view_state_changenotifier_mixin.dart';
import '../services/search_service_interface.dart';
import '../../../webservices/configuration/result.dart';
import '../models/SearchList.dart';
import '../viewmodels/searchlist_viewmodel.dart';

class SearchDataStore extends ChangeNotifier with ViewStateMixin {
  final ISearchService _searchService;

  SearchDataStore({required ISearchService searchService})
      : _searchService = searchService;

  SearchListVM? searchListViewModel;

  Future<void> fetchSearchItems() async {
    setBusy();
    _searchService.fetchSearchResults().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          searchListViewModel = prepareViewModelFrom(result.value);
          break;
        case ResultStatus.error:
          searchListViewModel = null;
          ApplicationException? exception = result.error;
          break;
      }
      setIdle();
    });
  }

  SearchListVM prepareViewModelFrom(SearchList? searchList) {
    return SearchListVM.fromSearchList(searchList);
  }
}
