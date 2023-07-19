import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/values/colors.dart' as colors;

import '../widgets/text.dart';

class LoadingWidget extends StatefulWidget {
  final bool backgroundTransparent;
  final String message;
  final bool status;
  final Widget child;

  const LoadingWidget({
    Key? key,
    this.status = false,
    required this.child,
    required this.message,
    required this.backgroundTransparent,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[widget.child, _loadingWidget(widget.status)],
    );
  }

  Widget _loadingWidget(bool loadingWidget) {
    return loadingWidget == true
        ? Container(
            alignment: Alignment.center,
            color: widget.backgroundTransparent == true
                ? Colors.transparent
                : Colors.grey.withOpacity(0.7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextWidget(text: widget.message),
                  ),
                  CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(colors.accentColor),
                  )
                ]),
          )
        : Container();
  }
}
