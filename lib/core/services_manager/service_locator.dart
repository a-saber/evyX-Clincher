import 'package:evyx_test/features/lawyer_profile/data/repo/lawyer_repo_imp.dart';
import 'package:get_it/get_it.dart';

abstract class ServiceLocator {
  static final GetIt getIt = GetIt.instance;

  static void setupForgotPassSingleton() {
    getIt.registerSingleton<LawyerRepoImp>(LawyerRepoImp());

  }
}
