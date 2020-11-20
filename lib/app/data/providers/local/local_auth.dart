import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/request_token.dart';

class LocalAuth {
  static const KEY = "session";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(RequestToken requestToken) async {
    await _storage.write(key: KEY, value: jsonEncode(requestToken.toJson()));
  }

  Future<RequestToken> getSession() async {
    final String data = await _storage.read(key: KEY);

    if (data != null) {
      final requestToken = RequestToken.fromJson(jsonDecode(data));

      if (DateTime.now().isBefore(requestToken.expiresAt)) {
        return requestToken;
      }
      return null;
    }
    return null;
  }

  Future<void> logOut() async {
    await _storage.delete(key: KEY);
  }
}
