import 'package:flutter_boilerplate/core/values/colors.dart' as colors;
import 'package:flutter_boilerplate/core/values/dimens.dart' as dimens;
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static void show(String msg) => Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colors.toastBackgroundColor,
        textColor: colors.toastTextColor,
        fontSize: dimens.fontText,
      );

  static void cancelAll() => Fluttertoast.cancel();
}
