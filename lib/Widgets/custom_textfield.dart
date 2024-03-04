// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hintText, this.onchange, this.obscureText = false, this.input});
  Function(String)? onchange;
  String? hintText;
  bool? obscureText;
  TextInputType? input;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: obscureText!,
      keyboardType: input,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) {
          return 'Invalid ';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          )),
    );
  }
}
