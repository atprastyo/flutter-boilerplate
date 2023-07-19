import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/text.dart';
import 'package:flutter_boilerplate/core/values/colors.dart' as colors;

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function()? onPress;
  final bool disabled;
  final bool transparent;
  final IconData? icon;
  final bool facebook;

  final double _elevation = 3;

  const ButtonWidget({
    Key? key,
    required this.label,
    this.onPress,
    this.disabled = false,
    this.transparent = false,
    this.icon,
    this.facebook = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = colors.accentColor;
    Color borderColor = colors.accentColor;
    Color textColor = Colors.white;

    if (transparent == true) {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.accentLightColor;
      textColor = colors.accentLightColor;
    } else {
      backgroundColor = colors.accentLightColor;
      borderColor = colors.accentLightColor;
      textColor = Colors.white;
    }

    if (facebook == true) {
      backgroundColor = colors.facebookColor;
      borderColor = colors.facebookColor;
      textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 45.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: _elevation,
          backgroundColor: backgroundColor,
        ),
        onPressed: onPress,
        child: TextWidget(
          text: label.toUpperCase(),
          small: true,
          color: textColor,
        ),
      ),
    );
  }
}
