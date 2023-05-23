import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const InputField({Key? key, required this.hintText, required this.controller,
    required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText
              ),
            )
        )
    );
  }
}