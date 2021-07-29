import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/pages/shared_widgets/dialogs.dart';
import 'package:http/http.dart';

bool checkErrors(BuildContext context, Response response) {
  Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  if (response.statusCode == 400 &&
      jsonResponse["error"]["message"] == "EMAIL_NOT_FOUND") {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        message: "E-mail não encontrado",
      ),
    );
  } else if (response.statusCode == 400 &&
      jsonResponse["error"]["message"] == "INVALID_PASSWORD") {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        message: "Credenciais incorretas",
      ),
    );
  } else if (response.statusCode == 400 &&
      jsonResponse["error"]["message"] == "EMAIL_EXISTS") {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        message: "E-mail já existente!",
      ),
    );
  } else if (response.statusCode >= 400) {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        message: "Aconteceu um erro desconhecido",
      ),
    );
  } else {
    return true;
  }

  return false;
}
