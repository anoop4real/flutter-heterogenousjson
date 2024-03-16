import 'exception_types.dart';

class ApplicationException implements Exception {
  ExceptionType _type = ExceptionType.unknownError;

  ApplicationException([ExceptionType? type])
      : _type = type ?? ExceptionType.unknownError;

  String message() => _type.message();
}