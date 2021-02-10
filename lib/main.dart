import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects/Screens/splash/view.dart';
import 'Helpers/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(getColorHexFromStr('#045074'))));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مزاد المواشي الصوتي',
      theme: ThemeData(
          accentColor: Color(getColorHexFromStr('#fe8800')),
          primaryColor: Color(getColorHexFromStr('#045074')),
          fontFamily: 'Cairo'),
      home: SplashView(),
    );
  }
}
