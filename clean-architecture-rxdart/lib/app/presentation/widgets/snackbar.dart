import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/values/colors.dart' as colors;

import './text.dart';

class SnackbarWidget {
  SnackbarWidget(GlobalKey<ScaffoldState> scaffoldKey,
      {bool error = false,
      required String message,
      Function? action,
      String? actionMessage}) {
    final snackbar = SnackBar(
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action == null ? () => null : action(),
              textColor: Colors.white54,
            ),
      backgroundColor:
          error == true ? Colors.redAccent : colors.snackbarBackgroundColor,
      content: TextWidget(
        white: true,
        bold: true,
        small: true,
        text: message,
      ),
    );

    if (scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(snackbar);
    }
  }
}
