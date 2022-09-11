import 'package:get_it/get_it.dart';
import 'package:ryalize_test/viewmodel/home_viewmodel.dart';

import 'services/firebase_service.dart';
import 'services/local_storage_service.dart';
import 'viewmodel/login_viewmodel.dart';
import 'viewmodel/register_viewmodel.dart';
import 'viewmodel/startup_viewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  // Viewmodel
  locator.registerFactory<StartUpViewModel>(() => StartUpViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}