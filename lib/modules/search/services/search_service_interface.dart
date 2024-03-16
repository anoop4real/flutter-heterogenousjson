import '../../../core/exceptions/app_exceptions.dart';
import '../../../webservices/configuration/result.dart';
import '../models/SearchList.dart';

// All the services that need to use Search should implement this.
abstract class ISearchService {
  Future<Result<SearchList, ApplicationException>> fetchSearchResults();
}