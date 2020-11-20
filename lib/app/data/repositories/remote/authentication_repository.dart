import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:getx_pattern/app/data/models/request_token.dart';
import 'package:getx_pattern/app/data/providers/remote/authentication_api.dart';

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<RequestToken> newRequestToken() => _api.newRequestToken();
  Future<RequestToken> authWithLogin({
    @required String userName,
    @required String password,
    @required String requestToken,
  }) =>
      _api.validateWithLogin(
        userName: userName,
        password: password,
        requestToken: requestToken,
      );
}
