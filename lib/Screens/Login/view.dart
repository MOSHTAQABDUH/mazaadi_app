import 'package:flutter/material.dart';
import 'package:projects/Helpers/custom_buttom.dart';
import 'package:projects/Helpers/snackbar.dart';
import 'package:projects/Helpers/text-field.dart';
import 'package:projects/Screens/Login/controller.dart';
import 'package:projects/Screens/forgetPassword/view.dart';
import 'package:projects/Screens/home/view.dart';
import 'package:projects/Screens/signUp/view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController _loginController = LoginController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _phone;
  String _password;
  bool _loading = false;

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result =
        await _loginController.userLogin(mobile: _phone, password: _password);
    setState(() {
      _loading = false;
    });
    print(_result);
    if (_result['success']) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    } else
      showInSnackBar(scaffoldKey: _scaffoldKey, value: _result['err']);
  }

  Widget _title({String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/imgs/logo.jpeg')),
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.grey),
                )
              ],
            ),
          ),
          _title(title: 'أهلا بكم في'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'مزاد المواشي الصوتي',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                textField(
                    type: TextInputType.number,
                    obSecure: false,
                    hintText: 'رقم الجوال',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'رقم الجوال مطلوب';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _phone = value;
                      });
                    }),
                textField(
                    type: TextInputType.text,
                    obSecure: true,
                    hintText: 'كلمة المرور',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _password = value;
                      });
                    }),
              ],
            ),
          ),
          customButton(
              context: context,
              title: Center(
                  child: _loading
                      ? CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: Colors.white),
                        )),
              onTap: () {
                _submitForm();
              }),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgetPasswordView()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'هل نسيت كلمة المرور ؟',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpView()));
                },
                child: Text(
                  'انشاء حساب في مزاد المواشي الصوتي',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
