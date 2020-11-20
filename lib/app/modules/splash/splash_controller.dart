import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/request_token.dart';
import 'package:getx_pattern/app/data/repositories/local/local_authentication_repository.dart';
import 'package:getx_pattern/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final _localAuthRepository = Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    _initApp();
  }

  void _initApp() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      RequestToken requestToken = await _localAuthRepository.session;

      Get.offNamed(
        requestToken != null ? AppRoutes.HOME : AppRoutes.LOGIN,
      );
    } catch (e) {
      print(e);
    }
  }
}
