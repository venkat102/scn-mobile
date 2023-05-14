import 'package:flutter/material.dart';

class GetTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData icon;
  bool isObscureText;

  GetTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isObscureText = false
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:20.0, left: 20.0, right:20.0, bottom: 5.0 ),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}