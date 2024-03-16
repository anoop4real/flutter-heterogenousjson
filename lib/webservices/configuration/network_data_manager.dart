
import 'dart:io';

import '../../webservices/configuration/result.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../core/exceptions/exception_types.dart';
import 'network_api.dart';
import 'package:dio/dio.dart';

class NetworkDataManager implements WebServiceApi {
  static const _defaultConnectTimeout = Duration(seconds: 60);
  static const _defaultReceiveTimeout = Duration(seconds: 60);

  final String baseUrl;
  Dio _dio = Dio();

  NetworkDataManager(this.baseUrl) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
  }
  @override
  Future<Result<dynamic, Exception>> executeGetWith(String url,
      {required Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      print(response.data);
      return Result.success(response.data);
    } catch (e) {
      ApplicationException exception = handleException(e);
      return Result.failure(exception);
    }
  }

  @override
  Future<Result<dynamic, Exception>> executePostWith(String url,
      {data, required Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(response.data);
    } catch (e) {
      ApplicationException exception = handleException(e);
      return Result.failure(exception);
    }
  }

  static ApplicationException handleException(error) {
    if (error is Exception) {
      try {
        ApplicationException exception;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.unknown:
              exception = ApplicationException(ExceptionType.unknownError);
              break;
            case DioExceptionType.badCertificate:
              exception = ApplicationException(ExceptionType.requestCancelled);
              break;
            case DioExceptionType.cancel:
              exception = ApplicationException(ExceptionType.requestCancelled);
              break;
            case DioExceptionType.connectionTimeout:
              exception = ApplicationException(ExceptionType.requestTimeout);
              break;
            case DioExceptionType.connectionError:
              exception =
                  ApplicationException(ExceptionType.noInternetConnection);
              break;
            case DioExceptionType.receiveTimeout:
              exception = ApplicationException(ExceptionType.timeout);
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  exception = ApplicationException(ExceptionType.badRequest);
                  break;
                case 401:
                  exception =
                      ApplicationException(ExceptionType.unauthorisedRequest);
                  break;
                case 403:
                  exception =
                      ApplicationException(ExceptionType.unauthorisedRequest);
                  break;
                case 404:
                  exception = ApplicationException(ExceptionType.notFound);
                  break;
                case 409:
                  exception = ApplicationException(ExceptionType.unknownError);
                  break;
                case 408:
                  exception =
                      ApplicationException(ExceptionType.requestTimeout);
                  break;
                case 500:
                  exception =
                      ApplicationException(ExceptionType.internalServerError);
                  break;
                case 503:
                  exception =
                      ApplicationException(ExceptionType.serviceUnavailable);
                  break;
                default:
                  exception = ApplicationException(ExceptionType.unknownError);
              }
              break;
            case DioExceptionType.sendTimeout:
              exception = ApplicationException(ExceptionType.timeout);
              break;
          }
        } else if (error is SocketException) {
          exception = ApplicationException(ExceptionType.noInternetConnection);
        } else {
          exception = ApplicationException(ExceptionType.unknownError);
        }
        return exception;
      } on FormatException catch (e) {
        return ApplicationException(ExceptionType.formatException);
      } catch (_) {
        return ApplicationException(ExceptionType.unknownError);
      }
    } else {
      return ApplicationException(ExceptionType.unknownError);
    }
  }
}