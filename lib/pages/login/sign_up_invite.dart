import 'package:flutter/material.dart';
import 'package:gym_app/pages/sign_up/sign_up_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

class SignUpInvite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Esqueceu a senha?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Text(
          "Ainda não tem uma conta?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            child: Text("Cadastre-se"),
            color: CustomColors().getActiveSecondaryButton(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
