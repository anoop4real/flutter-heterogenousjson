import 'dart:async';

import 'package:flutter_heterogenous_json/core/exceptions/app_exceptions.dart';
import 'package:flutter_heterogenous_json/modules/search/models/SearchList.dart';
import 'package:flutter_heterogenous_json/modules/search/services/search_service_interface.dart';
import 'package:flutter_heterogenous_json/webservices/configuration/api_path.dart';
import 'package:flutter_heterogenous_json/webservices/configuration/network_api.dart';
import 'package:flutter_heterogenous_json/webservices/configuration/network_data_manager.dart';
import 'package:flutter_heterogenous_json/webservices/configuration/result.dart';

class SearchService implements ISearchService {
  final WebServiceApi _networkDataManager;
  SearchService({WebServiceApi? networkDataManager})
      : _networkDataManager = networkDataManager ?? NetworkDataManager("https://my-json-server.typicode.com/anoop4real");
  @override
  Future<Result<SearchList, ApplicationException>> fetchSearchResults() {

    final completer = Completer<Result<SearchList, ApplicationException>>();
    _networkDataManager.executeGetWith(APIPath.search.path,
        queryParameters: {}).then((result) {
      // TODO: check status
      switch (result.status) {
        case ResultStatus.success:
          var rate = SearchList.fromJson(result.value);
          print(rate);
          completer.complete(Result.success(rate));
          break;
        case ResultStatus.error:
          completer.complete(Result.failure(result.error as ApplicationException?));
          break;
      }
    });
    return completer.future;
  }
  
}