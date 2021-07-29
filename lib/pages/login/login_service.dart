import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_page.dart';
import 'package:gym_app/shared/constants/routes.dart';
import 'package:gym_app/shared/helpers/check_web_errors.dart';
import 'package:gym_app/shared/helpers/dao_user.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  login(BuildContext context, String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signIn()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    bool hasNoError = checkErrors(context, response);

    if (hasNoError) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      LoginModel model = LoginModel(
        name: jsonResponse["displayName"],
        email: jsonResponse["email"],
        localId: jsonResponse["localId"],
        idToken: jsonResponse["idToken"],
      );
      DaoUser().saveUser(model);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }

    print(response.statusCode);
    print(response.body);
  }
}
