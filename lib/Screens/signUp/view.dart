import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/Helpers/custom_buttom.dart';
import 'package:projects/Helpers/snackbar.dart';
import 'package:projects/Helpers/text-field.dart';
import 'package:projects/Screens/Login/view.dart';
import 'package:projects/Screens/cities/controller.dart';
import 'package:projects/Screens/cities/model.dart';
import 'package:projects/Screens/signUp/controller.dart';
import 'package:projects/Screens/verifyAccount/view.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SignUpController _signUpController = SignUpController();
  CityModel _cityModel = CityModel();
  CityController _cityController = CityController();
  bool _cityLoading = true;

  String _name,
      _phone,
      _email,
      _password,
      _selectedCity,
      _confirmPassword,
      _type,
      _deviceId,
      _lat,
      _lng,
      _avatar;
  int _cityId;
  bool _loading = false;

  @override
  void initState() {
    _getCity();
    super.initState();
  }

  _getCity() async {
    _cityModel = await _cityController.getCity();
    setState(() {
      _cityLoading = false;
    });
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      //01000628877
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result = await _signUpController.userSignUp(
        avatar: _avatar,
        cityId: _cityId,
        confirmPassword: _confirmPassword,
        deviceId: _deviceId,
        email: _email,
        lat: _lat,
        long: _lng,
        name: _name,
        password: _password,
        phone: _phone,
        type: _type);
    setState(() {
      _loading = false;
    });
    print(_result);
    if (_result['success']) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => VerifyAccountView()));
    } else
      showInSnackBar(scaffoldKey: _scaffoldKey, value: _result['err']);
  }

  Widget _title({String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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

  chooseCountry(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              backgroundColor: Color(0xffFFFFFF),
              title: Text(
                " ..  إختر مدينتك",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Color(0xff191919),
                    fontSize: 22,
                    fontFamily: "CairoSemiBold"),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                        height: MediaQuery.of(context).size.height * .7,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            border: Border(
                                top: BorderSide(
                                    color: Color(0xff707070).withOpacity(.3)))),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: CupertinoScrollbar(
                          child: ListView(
                            children: <Widget>[
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                itemCount: _cityModel.data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      this.setState(() {
                                        _selectedCity =
                                            _cityModel.data[index].name.ar;
                                        _cityId = _cityModel.data[index].id;
                                      });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 6),
                                          decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xff707070)
                                                        .withOpacity(.3)),
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "${_cityModel.data[index].name.ar}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff191919),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily:
                                                        "CairoSemiBold"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _cityLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                _title(title: 'انشاء حساب في'),
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
                            hintText: 'الاسم بالكامل',
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'الاسم مطلوب';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                            obSecure: false),
                        textField(
                            hintText: 'رقم الهاتف',
                            type: TextInputType.number,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'رقم الهاتف مطلوب';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _phone = value;
                              });
                            },
                            obSecure: false),
                        InkWell(
                          onTap: () {
                            chooseCountry(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(0.1)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(_selectedCity == null
                                      ? 'المدينة'
                                      : _selectedCity)
                                ],
                              ),
                            ),
                          ),
                        ),
                        textField(
                            hintText: 'البريد الالكتروني',
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'البريد الالكتروني مطلوب';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            obSecure: false),
                        textField(
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
                            },
                            obSecure: true),
                        textField(
                            hintText: 'تأكيد كلمة المرور',
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'كلمة المرور مطلوبة';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _confirmPassword = value;
                              });
                            },
                            obSecure: false),
                      ],
                    )),
                customButton(
                    context: context,
                    title: Center(
                        child: _loading
                            ? CircularProgressIndicator(
                                strokeWidth: 10,
                              )
                            : Text(
                                'تسجيل ',
                                style: TextStyle(color: Colors.white),
                              )),
                    onTap: () {
                      _submitForm();
                    }),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
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
                SizedBox(
                  height: 40,
                ),
              ],
            ),
    );
  }
}
