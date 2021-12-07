import 'package:flutter/material.dart';

typedef void StringCallback(String val);

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {Key? key,
      required this.title,
      required this.placeHolder,
      this.isHiddenInput = false,
      this.textInputType = TextInputType.text,
      this.onChangedCallback})
      : super(key: key);

  final String title;
  final String placeHolder;
  final bool isHiddenInput;
  final TextInputType textInputType;

  final StringCallback? onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
          ),
        ),
        border: OutlineInputBorder(),
        labelText: title,
        labelStyle:
            TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        hintText: placeHolder,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: isHiddenInput,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: textInputType,
      onChanged: (String value) {
        if (onChangedCallback != null) {
          onChangedCallback!(value);
        }
      },
    );
  }
}
