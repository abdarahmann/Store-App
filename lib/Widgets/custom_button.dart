// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.ontab,required this.color,this.textColor});
  String text;
  Color color;
   Color ?textColor;
  VoidCallback? ontab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:color,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20,color:textColor ),
          ),
        ),
      ),
    );
  }
}
