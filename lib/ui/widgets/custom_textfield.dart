import 'package:flutter/material.dart';

Widget CustomTextField(hintext,labeltext,Icon,keyType,controller,validator,{obscureText=false}) {
  return TextFormField(
    keyboardType:keyType,
    controller: controller,
    validator: validator,
    obscureText: obscureText,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      filled: true,
      hintText: labeltext,
      labelText: hintext,
      prefixIcon: Icon,
    ),
  );
}
