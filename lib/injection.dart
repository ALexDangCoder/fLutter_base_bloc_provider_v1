import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../infrastructure/auth/auth_api.dart';
import 'domain/core/config_manager.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> setupInjection() async {
  getIt.init();
  await _registerNetworkComponents();
}

Future<void> _registerNetworkComponents() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: ConfigManager.getInstance()!.apiBaseUrl,
      connectTimeout: 10000,
    ),
  );

  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ],
  );
  getIt.registerLazySingleton(() => dio);

  getIt.registerLazySingleton(
    () => AuthApi(dio, baseUrl: '${dio.options.baseUrl}user/'),
  );
}
