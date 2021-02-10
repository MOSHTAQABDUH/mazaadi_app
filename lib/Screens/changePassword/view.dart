import 'package:flutter/material.dart';
import 'package:projects/Helpers/custom_buttom.dart';
import 'package:projects/Helpers/text-field.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
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
                    type: TextInputType.text,
                    obSecure: true,
                    hintText: 'كلمة المرورالجديدة',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return '';
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
                    hintText: 'تأكيد كلمة المرور الجديدة',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return '';
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
                'تأكيد كلمة المرور الجديدة',
                style: TextStyle(color: Colors.white),
              )),
              onTap: () {}),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
