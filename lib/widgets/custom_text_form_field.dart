import 'package:flutter/material.dart';

class CustomTextFormFailed extends StatelessWidget {
  String? text;
  Function(String)? onChang;

  Widget? iconData;

  bool obscureText;

  CustomTextFormFailed(
      {Key? key,
      required this.text,
      this.onChang,
      this.obscureText = false,
      this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required ';
        }
      },
      onChanged: onChang,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: text,
          suffixIcon: iconData,
          hintStyle: const TextStyle(color: Colors.white)),
    );
  }
}
