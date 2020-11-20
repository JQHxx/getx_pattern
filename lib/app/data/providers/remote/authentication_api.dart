import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:getx_pattern/app/data/models/request_token.dart';
import 'package:getx_pattern/app/utils/app_constants.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<RequestToken> newRequestToken() async {
    final Response response = await _dio.get(
      AppConstants.NEW_TOKEN,
      queryParameters: {"api_key": AppConstants.THE_MOVIE_API},
    );

    return RequestToken.fromJson(response.data);
  }

  Future<RequestToken> validateWithLogin({
    @required String userName,
    @required String password,
    @required String requestToken,
  }) async {
    final Response response =
        await _dio.post(AppConstants.VALIDATE_WITH_LOGIN, queryParameters: {
      "api_key": AppConstants.THE_MOVIE_API
    }, data: {
      "username": userName,
      "password": password,
      "request_token": requestToken,
    });

    return RequestToken.fromJson(response.data);
  }
}
