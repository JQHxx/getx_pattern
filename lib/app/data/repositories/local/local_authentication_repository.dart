import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/request_token.dart';
import 'package:getx_pattern/app/data/providers/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(RequestToken requestToken) =>
      _localAuth.setSession(requestToken);

  Future<RequestToken> get session => _localAuth.getSession();

  Future<void> logOut() => _localAuth.logOut();
}
