

import 'package:flutter_heterogenous_json/modules/search/services/search_service.dart';
import 'package:flutter_heterogenous_json/modules/search/services/search_service_interface.dart';
import 'package:flutter_heterogenous_json/webservices/configuration/api_environment.dart';
import 'package:flutter_heterogenous_json/webservices/configuration/network_data_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/search/datastore/search_datastore.dart';
import '../../webservices/configuration/network_api.dart';


final mqttManagerProvider = ChangeNotifierProvider<SearchDataStore>((ref) {
  return SearchDataStore(searchService: ref.read(searchServiceProvider));
});

final searchServiceProvider = Provider<ISearchService>((ref) {
  return SearchService(networkDataManager: ref.read(apiProvider));
});

final apiProvider = Provider<WebServiceApi>((ref) {
  return NetworkDataManager(APIEnvironment.production.baseURL);
});