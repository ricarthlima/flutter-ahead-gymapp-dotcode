import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_page.dart';
import 'package:gym_app/shared/constants/routes.dart';
import 'package:gym_app/shared/helpers/check_web_errors.dart';
import 'package:gym_app/shared/helpers/dao_user.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  signUp(
      BuildContext context, String name, String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signUp()),
      body: json.encode(
        {
          "displayName": name,
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
        email: jsonResponse["email"],
        idToken: jsonResponse["idToken"],
        name: name,
      );
      DaoUser().saveUser(model);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }

    print(response.body);
  }
}
