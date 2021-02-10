import 'package:flutter/material.dart';
import 'colors.dart';

void showInSnackBar({String value, GlobalKey<ScaffoldState> scaffoldKey}) {
  scaffoldKey.currentState.showSnackBar(
    new SnackBar(
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Color(
        getColorHexFromStr("#1e7145"),
      ),
      duration: Duration(seconds: 2),
      content: new Text(
        value ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    ),
  );
}
