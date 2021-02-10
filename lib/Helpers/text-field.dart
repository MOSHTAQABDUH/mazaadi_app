import 'package:flutter/material.dart';

Widget textField(
    {String hintText,
    Function validator,
    Function onSaved,
    TextInputType type,
    bool obSecure,
    TextEditingController controller}) {
  return Padding(
    padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
          controller: controller,
          obscureText: obSecure,
          keyboardType: type,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 13)),
          validator: validator,
          onSaved: onSaved),
    ),
  );
}
