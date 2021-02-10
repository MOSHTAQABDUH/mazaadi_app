import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projects/Screens/Login/view.dart';
import 'package:projects/Screens/home/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String _token;

  @override
  void initState() {
    _getToken();
    Timer(Duration(seconds: 2), () {
      _token != null
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginView()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeView()));
    });
    super.initState();
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(140),
              image: DecorationImage(
                  image: AssetImage('assets/imgs/logo.jpeg'),
                  fit: BoxFit.cover)),
        )
      ],
    )));
  }
}
