import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constat.dart';
import '../../features/Home/data/repos/home_repo_impl.dart';
import '../../features/Home/data/web_services/web_services.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<WebServices>(
    () => WebServices(dio: createAndSetupDio()),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio.options.baseUrl = baseURL;
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      responseHeader: false,
      requestHeader: false,
      request: true,
    ),
  );
  return dio;
}
