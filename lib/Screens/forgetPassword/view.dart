import 'package:flutter/material.dart';
import 'package:projects/Helpers/custom_buttom.dart';
import 'package:projects/Helpers/text-field.dart';
import 'package:projects/Screens/Login/view.dart';
import 'package:projects/Screens/changePassword/view.dart';

class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          _title(title: 'تعيين كلمة مرور'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'جديدة',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
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
                      setState(() {});
                    }),
                textField(
                    type: TextInputType.emailAddress,
                    obSecure: true,
                    hintText: 'البريد الالكتروني',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'البريد الالكتروني مطلوب';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {});
                    }),
              ],
            ),
          ),
          customButton(
              context: context,
              title: Center(
                  child: Text(
                'تعيين كلمة مرور جديدة',
                style: TextStyle(color: Colors.white),
              )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordView()));
              }),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                child: Text(
                  'لديك حساب بالفعل ؟',
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
