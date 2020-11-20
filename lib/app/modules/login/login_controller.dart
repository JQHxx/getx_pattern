import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/request_token.dart';
import 'package:getx_pattern/app/data/repositories/local/local_authentication_repository.dart';
import 'package:getx_pattern/app/data/repositories/remote/authentication_repository.dart';
import 'package:getx_pattern/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final _repository = Get.find<AuthenticationRepository>();
  final _localAuthRepository = Get.find<LocalAuthRepository>();
  String _userName = '', _password = '';

  void changeName(String value) => this._userName = value;
  void changePassword(String value) => this._password = value;

  Future<void> startSesion() async {
    print(_userName);
    print(_password);

    try {
      RequestToken requestToken = await _repository.newRequestToken();

      this._userName = "YeisonGutty0007";
      this._password = "12345";

      RequestToken authRequestToken = await _repository.authWithLogin(
        userName: _userName,
        password: _password,
        requestToken: requestToken.requestToken,
      );

      await _localAuthRepository.setSession(authRequestToken);
      Get.offNamed(
        AppRoutes.HOME,
      );
    } catch (e) {
      print(e);
      String message = '';
      if (e is DioError) {
        message = e.response.statusMessage;
      } else {
        message = e.message;
      }

      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
    }
  }
}
