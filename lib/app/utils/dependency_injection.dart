import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/providers/local/local_auth.dart';
import 'package:getx_pattern/app/data/providers/remote/authentication_api.dart';
import 'package:getx_pattern/app/data/providers/remote/movies_api.dart';
import 'package:getx_pattern/app/data/repositories/local/local_authentication_repository.dart';
import 'package:getx_pattern/app/data/repositories/remote/authentication_repository.dart';
import 'package:getx_pattern/app/data/repositories/remote/movies_repository.dart';
import 'package:getx_pattern/app/utils/app_constants.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(
      () => FlutterSecureStorage(),
      fenix: true,
    );
    Get.lazyPut<Dio>(
      () => Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
      fenix: true,
    );

    // Providers
    Get.lazyPut<AuthenticationAPI>(
      () => AuthenticationAPI(),
      fenix: true,
    );
    Get.lazyPut<LocalAuth>(
      () => LocalAuth(),
      fenix: true,
    );
    Get.lazyPut<MoviesAPI>(
      () => MoviesAPI(),
      fenix: true,
    );

    // Repositories
    Get.lazyPut<LocalAuthRepository>(
      () => LocalAuthRepository(),
      fenix: true,
    );
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepository(),
      fenix: true,
    );
    Get.lazyPut<MovieRepository>(
      () => MovieRepository(),
      fenix: true,
    );
  }
}
