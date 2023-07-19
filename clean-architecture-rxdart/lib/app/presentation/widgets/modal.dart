import 'package:flutter/material.dart';

import 'text.dart';

class ModalWidget {
  static Future show(
    BuildContext context, {
    IconData? icon,
    String? title,
    required Widget body,
    String? confirmLabel,
    Function? confirmOnPress,
    String? cancelLabel,
    Function? cancelOnPress,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: icon == null
              ? title == null
                  ? null
                  : TextWidget(text: title)
              : Row(
                  children: <Widget>[
                    Icon(icon),
                    SizedBox(width: 8.0),
                    TextWidget(text: title ?? "")
                  ],
                ),
          content: SingleChildScrollView(child: body),
          actions: <Widget>[
            //CANCEL BUTTON
            if (cancelLabel != null)
              TextButton(
                  child: TextWidget(
                    text: cancelLabel,
                    color: Colors.grey.shade400,
                  ),
                  onPressed: () {
                    if (cancelOnPress != null) cancelOnPress();
                    Navigator.pop(context);
                  }),

            //CONFIRM BUTTONS
            if (confirmLabel != null && cancelLabel == null)
              TextButton(
                child: TextWidget(text: confirmLabel, accent: true),
                onPressed: () {
                  if (confirmOnPress != null) confirmOnPress();
                  Navigator.pop(context);
                },
              ),

            if (cancelLabel != null)
              TextButton(
                child: TextWidget(text: cancelLabel, accent: true),
                onPressed: () {
                  if (confirmOnPress != null) confirmOnPress();
                  Navigator.pop(context);
                },
              )
          ],
        ),
      );
}
