import 'package:evyx_test/core/resources_manager/constants_manager.dart';
import 'package:evyx_test/core/services_manager/service_locator.dart';
import 'package:evyx_test/features/lawyer_profile/data/repo/lawyer_repo_imp.dart';
import 'package:evyx_test/features/lawyer_profile/presentation/cubit/get_lawyer_data/get_lawyer_data_cubit.dart';
import 'package:evyx_test/features/lawyer_profile/presentation/views/lawyer_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../cache_helper/cache_data.dart';
import '../localization/app_localization.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => GetLawyerDataCubit(ServiceLocator.getIt.get<LawyerRepoImp>())..getLawyerData()),
      ],
      child: GetMaterialApp(
        locale: Locale(CacheData.lang!),
        translations: AppLocalization(),
        title: ConstantsManager.appTitle,
        theme: ThemeManager.theme,
        debugShowCheckedModeBanner: false,
        home: const LawyerProfileView(),
      )
    );
  }
}