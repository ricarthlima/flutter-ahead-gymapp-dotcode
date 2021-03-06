import 'package:flutter/material.dart';
import 'package:gym_app/pages/shared_widgets/dialogs.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

import 'login_service.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.length < 5) {
                return "Esse e-mail parece curto demais";
              } else if (!value.contains("@")) {
                return "Esse e-mail está meio estranho, não?";
              }
              return null;
            },
            controller: _mailInputController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.mail_outline,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value!.length < 6) {
                return "A senha deve ter pelo menos 6 caracteres";
              }
              return null;
            },
            obscureText: _obscurePassword,
            controller: _passwordInputController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.vpn_key_sharp,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: this._obscurePassword,
                onChanged: (bool? newValue) {
                  setState(() {
                    this._obscurePassword = newValue!;
                  });
                },
                activeColor: Colors.blue,
              ),
              Text(
                "Mostrar senha",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _doLogin();
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                CustomColors().getActivePrimaryButtonColor(),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _doLogin() async {
    if (_formKey.currentState!.validate()) {
      LoginService().login(
          context, _mailInputController.text, _passwordInputController.text);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(
            message: "Há erros no seu formulário.",
          );
        },
      );
    }
  }
}
