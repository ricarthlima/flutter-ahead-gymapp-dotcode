import 'package:flutter/material.dart';
import 'package:gym_app/pages/login/login_form.dart';
import 'package:gym_app/pages/login/login_service.dart';
import 'package:gym_app/pages/login/sign_up_invite.dart';
import 'package:gym_app/pages/sign_up/sign_up_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool animeLogo = false;
  bool animeForm = false;

  @override
  void initState() {
    super.initState();
    callAnimations();
  }

  void callAnimations() async {
    await Future.delayed(Duration(milliseconds: 200));
    animeLogo = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecondaryColor(),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedPositioned(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      animeForm = true;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 720),
                    curve: Curves.easeIn,
                    height: !animeLogo ? 0 : 150,
                    child: Image.asset(
                      "assets/gymapp-logo02.png",
                      height: 125,
                    ),
                  ),
                ),
                duration: Duration(milliseconds: 750),
              ),
              Visibility(
                visible: !animeForm,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 750),
                  opacity: !animeLogo ? 0 : 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "Clique para começar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                margin: EdgeInsets.only(top: 40),
                height: !animeForm ? 0 : 400,
                duration: Duration(seconds: 1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Entrar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LoginForm(),
                      SignUpInvite(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
