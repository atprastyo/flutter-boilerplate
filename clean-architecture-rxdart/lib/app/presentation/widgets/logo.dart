import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool header;
  final bool small;
  final bool challenge;

  const LogoWidget({
    Key? key,
    this.challenge = true,
    this.small = true,
    this.header = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _logo = AssetImage("assets/logo.png");
    var _logoHeader = AssetImage("assets/logo_header.png");

    final _finalLogoWidget = header == true ? _logoHeader : _logo;

    return Image(
      image: _finalLogoWidget,
      width: small == true
          ? 100
          : header == true
              ? 100
              : 220,
      //fit: BoxFit.contain,
    );
  }
}
