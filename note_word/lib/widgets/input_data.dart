import 'package:flutter/material.dart';

class Input_Data extends StatelessWidget {
  final TextEditingController textValue;
  final bool isObscure;
  final String hinttext;
  const Input_Data({Key? key,required this.textValue,required this.hinttext,this.isObscure = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textValue,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
