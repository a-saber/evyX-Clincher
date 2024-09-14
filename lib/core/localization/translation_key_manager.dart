
import 'dart:ui';

import '../cache_helper/cache_helper_keys.dart';


class TranslationKeyManager {
  static const Locale localeEN = Locale(CacheHelperKeys.keyEN);
  static const Locale localeAR = Locale(CacheHelperKeys.keyAR);

  static const String noInternetConnectionMessage = 'Check your internet connection';
  static const String sendTimeoutMessage = 'Send timeout with the API server';
  static const String receiveTimeoutMessage = 'Receive timeout with the API server';
  static const String cancelRequestMessage = 'Request to the API server was canceled';
  static const String unknownErrorMessage = 'Unexpected error, please try again later!';
  static const String internalServerErrorMessage = "Internal server error, please try again later.";
  static const String tooManyRequestsMessage = "Too many requests. Please try again later.";
}
