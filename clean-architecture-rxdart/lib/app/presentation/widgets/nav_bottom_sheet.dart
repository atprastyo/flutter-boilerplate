import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/values/colors.dart' as colors;

import 'card_view.dart';
import 'text.dart';

class NavBottomSheetWidget extends StatelessWidget {
  final String? buttonLeft;
  final String? buttonRight;
  final Function? actionButtonLeft;
  final Widget? pageToCall;

  const NavBottomSheetWidget({
    Key? key,
    this.buttonLeft,
    this.buttonRight,
    this.actionButtonLeft,
    this.pageToCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CardViewWidget(
        width: double.infinity,
        height: 63,
        child: ListTile(
          leading: buttonLeft != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () => actionButtonLeft?.call(context),
                    child: TextWidget(
                      text: buttonLeft!,
                    ),
                  ),
                )
              : null,
          trailing: buttonRight != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextButton(
                    onPressed: () {
                      if (pageToCall != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pageToCall!),
                        );
                      }
                    },
                    child: TextWidget(
                      color: colors.accentColor,
                      text: buttonRight!,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
