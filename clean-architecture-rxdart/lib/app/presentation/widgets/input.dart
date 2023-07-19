import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/values/colors.dart' as colors;
import 'package:flutter_boilerplate/core/values/dimens.dart' as dimens;

class InputWidget extends StatefulWidget {
  final bool? autofocus;
  final String? value;
  final Function(dynamic)? onChange;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;
  final String? errorMessage;
  final String? labelText;
  final String? mask;

  const InputWidget({
    Key? key,
    this.autofocus,
    this.value,
    this.errorMessage,
    this.onChange,
    this.placeholder,
    this.keyboardType,
    this.password = false,
    this.dark = false,
    this.multiline = false,
    this.labelText,
    this.mask,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.value != null) {
      _controller.text = widget.value!;
      _controller.selection =
          TextSelection.collapsed(offset: widget.value!.length);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: dimens.fieldSpace),
      child: TextField(
        controller: _controller,
        obscureText: widget.password == true ? true : false,
        onChanged: widget.onChange,
        maxLines: widget.multiline == true ? null : 1,
        keyboardType: widget.multiline == true
            ? TextInputType.multiline
            : widget.keyboardType,
        style: TextStyle(
          color: widget.dark == false
              ? colors.primaryColor
              : colors.primaryColorDark,
        ),
        autofocus: widget.autofocus == null ? false : true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 4),
          hintText: widget.labelText == null ? "Holder" : widget.labelText,
          labelText:
              widget.labelText == null ? widget.placeholder : widget.labelText,
          //errorText: widget.errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.dark == false
                  ? Colors.white
                  : colors.primaryColor, //cor da borda
              width: 0.5,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.transparent,
            fontSize: dimens.fontInputWidget,
          ),
          enabled: true,
          labelStyle: TextStyle(
              fontSize: dimens.fontInputWidget,
              color: widget.dark == false
                  ? colors.accentColor
                  : colors.primaryColor //cor da label
              ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colors.accentColor,
              width: 0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.dark == false
                  ? colors.primaryColor
                  : colors.accentColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
