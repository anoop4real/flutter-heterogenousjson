import '../../webservices/configuration/result.dart';

abstract class WebServiceApi {

  Future<Result<dynamic, Exception>> executeGetWith(String url,
      {required Map<String, dynamic> queryParameters});

  Future<Result<dynamic, Exception>> executePostWith(String url,
      {data, required Map<String, dynamic> queryParameters});
}