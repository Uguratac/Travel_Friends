import 'package:flutter/material.dart';

Widget activatebutton({Function()? onTap, String title = ""}) {
  return TextButton(
      onPressed: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ));
}

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final bool obscureTextt;
  TextEditingController controller;
  static final tName = TextEditingController();
  static final tEmail = TextEditingController();
  static final tPassword = TextEditingController();
  static final tConfirmpassword = TextEditingController();

  MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureTextt = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureTextt,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
