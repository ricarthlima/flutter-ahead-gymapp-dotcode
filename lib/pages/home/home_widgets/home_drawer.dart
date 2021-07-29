import 'package:flutter/material.dart';
import 'package:gym_app/pages/login/login_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/helpers/dao_user.dart';
import 'package:gym_app/shared/models/login_model.dart';

Drawer getHomeDrawer(BuildContext context, LoginModel loginModel) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xff0A6D92)),
          accountName: Text(
            loginModel.name != null ? loginModel.name! : 'Guest',
          ),
          accountEmail: Text(loginModel.email!),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "RL",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text(
            "Configurações",
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_back_sharp,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text(
            "Sair",
          ),
          onTap: () {
            DaoUser().clearUser();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        )
      ],
    ),
  );
}
