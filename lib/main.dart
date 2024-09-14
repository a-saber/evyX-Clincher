import 'package:evyx_test/core/dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/cache_helper/cashe_helper.dart';
import 'core/localization/app_localization.dart';
import 'core/services_manager/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await AppLocalization.setLanguage();
  await DioHelper.init();
  ServiceLocator.setupForgotPassSingleton();
  runApp(const MyApp());
}
