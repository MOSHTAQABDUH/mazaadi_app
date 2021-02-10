import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/Helpers/custom_buttom.dart';
import 'package:projects/Helpers/text-field.dart';
import 'package:projects/Screens/drawer/view.dart';

class AddItemView extends StatefulWidget {
  @override
  _AddItemViewState createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context: context),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'مزادات الطائف',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
            top: 130,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'اضافة سلعة في ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'مزاد المواشي الصوتي',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    textField(
                        type: TextInputType.text,
                        hintText: 'اسم السلعة',
                        obSecure: false),
                    textField(
                        type: TextInputType.text,
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
                        type: TextInputType.text,
                        hintText: 'الموقع',
                        obSecure: false),
                    textField(
                        type: TextInputType.text,
                        hintText: 'اسم عارض السلعة',
                        obSecure: false),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.2)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.add),
                            Text('اضافة صور / فيديو'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('اوافق علي الشروط والاحكام'),
                          Checkbox(
                            value: true,
                            checkColor: Theme.of(context).accentColor,
                            onChanged: (v) {},
                          ),
                        ],
                      ),
                    ),
                    customButton(
                        context: context,
                        title: Center(
                            child: Text(
                          'ارسال',
                          style: TextStyle(color: Colors.white),
                        )))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
