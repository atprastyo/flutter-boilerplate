import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/modules/authenticated/home/home.page.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/button.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/input.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/logo.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/snackbar.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/text.dart';
import 'package:flutter_boilerplate/core/device/nav/nav_slide_from_top.dart';
import 'package:flutter_boilerplate/core/di/injector_provider.dart';
import 'package:flutter_boilerplate/core/values/dimens.dart' as dimens;

import 'login.viewmodel.dart';

class LoginWidget {
  final vm = inject<LoginViewModel>();

  Widget form(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            LogoWidget(),
            SizedBox(height: 20),
            StreamBuilder(
                stream: vm.login,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "USERNAME",
                    value: snapshot.data.toString(),
                    onChange: (value) => vm.setLogin(value),
                  );
                }),
            SizedBox(height: 10),
            StreamBuilder(
                stream: vm.password,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "PASSWORD",
                    value: snapshot.data.toString(),
                    onChange: (value) => vm.setPassword(value),
                  );
                }),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => print("forgot password click"),
                  child: TextWidget(
                    text: "Forgot Password?",
                    small: true,
                  ),
                )),
            SizedBox(height: 12),
            ButtonWidget(
                label: "login",
                onPress: () async {
                  final ret = await vm.signIn();

                  if (ret) {
                    SnackbarWidget(key, message: "SUCCESS");
                  } else {
                    SnackbarWidget(key,
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }

                  await Future.delayed(Duration(seconds: 1));

                  Navigator.pushReplacement(
                      context, NavSlideFromTop(page: HomePage()));
                }),
            SizedBox(height: 12),
            ButtonWidget(
                label: "Register",
                transparent: true,
                onPress: () async {
                  final ret = await vm.signIn();

                  if (ret) {
                    SnackbarWidget(key, message: "SUCCESS");
                  } else {
                    SnackbarWidget(key,
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }

                  Navigator.pushReplacement(
                      context, NavSlideFromTop(page: HomePage()));
                }),
            SizedBox(height: 12),
            ButtonWidget(
                facebook: true,
                label: "Enter with facebook",
                onPress: () async {
                  final ret = await vm.signIn();

                  if (ret) {
                    SnackbarWidget(key, message: "SUCCESS");
                  } else {
                    SnackbarWidget(key,
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }

                  Navigator.pushReplacement(
                      context, NavSlideFromTop(page: HomePage()));
                })
          ],
        ),
      ),
    );
  }
}
