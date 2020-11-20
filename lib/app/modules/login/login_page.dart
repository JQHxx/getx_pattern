import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_pattern/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "User Name"),
                    onChanged: _.changeName,
                  ),
                  TextField(
                    // obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                    onChanged: _.changePassword,
                  ),
                  FlatButton(
                    color: Colors.red,
                    child: Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _.startSesion,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
