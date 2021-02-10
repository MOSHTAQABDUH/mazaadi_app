import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  Widget _card() {
    return Material(
      elevation: 0.3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white70),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Icon(Icons.notifications)),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'عرض أغنام',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          'الرياض - المملكة العربية السعودية',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'يتم وصف تفاصيل العرض هنا',
                  style: TextStyle(color: Colors.black26),
                )
              ],
            )),
      ),
    );
  }

  Widget _view() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (ctx, index) {
        return _card();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      'التنبيهات',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
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
              child: _view(),
            ),
          )
        ],
      ),
    );
  }
}
