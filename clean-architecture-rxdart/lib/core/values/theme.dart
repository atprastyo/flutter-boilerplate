import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData appTheme = ThemeData(
  primaryColor: colors.primaryColor,
  scaffoldBackgroundColor: colors.backgroundColor,

  appBarTheme: AppBarTheme(
    color: colors.backgroundColor,
    iconTheme: IconThemeData(color: colors.accentLightColor)
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: colors.accentLightColor,
    disabledColor: colors.primaryColorDark
  )
);
