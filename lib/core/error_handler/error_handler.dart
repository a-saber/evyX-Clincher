import 'package:dio/dio.dart';
import 'package:evyx_test/core/localization/translation_key_manager.dart';

// Base class for failure types
abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

// Specific failure for data issues
class DataFailure extends Failure {
  DataFailure(super.errorMessage);
}

// Specific failure for server issues
class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  // Factory constructor to handle Dio errors
  factory ServerFailure.fromDioError(DioException dioError) {
    print(dioError.type.name);
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(TranslationKeyManager.noInternetConnectionMessage);
      case DioExceptionType.sendTimeout:
        return ServerFailure(TranslationKeyManager.sendTimeoutMessage);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(TranslationKeyManager.receiveTimeoutMessage);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response?.statusCode, dioError.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure(TranslationKeyManager.cancelRequestMessage);
      case DioExceptionType.unknown:
        if (dioError.message != null && dioError.message!.contains('SocketException')) {
          return ServerFailure(TranslationKeyManager.noInternetConnectionMessage);
        }
        return ServerFailure(TranslationKeyManager.unknownErrorMessage);
      default:
        return ServerFailure(TranslationKeyManager.noInternetConnectionMessage);
    }
  }

  // Factory constructor to handle specific server responses
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (response != null && response is Map<String, dynamic> && response['error'] != null) {
      return ServerFailure(response['error']['message']);
    }
    switch (statusCode) {
      case 404:
        return ServerFailure(TranslationKeyManager.unknownErrorMessage);
      case 500:
        return ServerFailure(TranslationKeyManager.internalServerErrorMessage);
      case 429:
        return ServerFailure(TranslationKeyManager.tooManyRequestsMessage);
      default:
        return ServerFailure(TranslationKeyManager.unknownErrorMessage);
    }
  }
}
