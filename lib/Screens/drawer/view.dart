import 'package:flutter/material.dart';
import 'package:projects/Screens/favorites/view.dart';
import 'package:projects/Screens/myAuctions/view.dart';
import 'package:projects/Screens/notifications/view.dart';
import 'package:projects/Screens/splash/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget drawer(
    {BuildContext context,
    String userName,
    String userEmailm,
    String userImage}) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.5,
    child: Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                )),
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.grey),
                  ),
                  Text(
                    userName ?? '',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userEmailm ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          _card(title: 'الرئيسية', onTap: () {}),
          _card(
              title: 'مزاداتي',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAuctionView()));
              }),
          _card(
              title: 'غرف المزاد المفضلة',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesView()));
              }),
          _card(title: 'حساب العمولة', onTap: () {}),
          _card(title: 'معاهدة استخدام الخدمة', onTap: () {}),
          _card(
              title: 'التنبيهات',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsView()));
              }),
          _card(title: 'السلع الممنوعة', onTap: () {}),
          _card(title: 'من نحن', onTap: () {}),
          _card(title: 'اتصل بنا', onTap: () {}),
          _card(title: 'عن التطبيق', onTap: () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: InkWell(
              onTap: () async {
                final SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                _prefs.clear();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashView()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 10,
                  ),
                  Text('تسجيل الخروج'),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _card({String title, Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
