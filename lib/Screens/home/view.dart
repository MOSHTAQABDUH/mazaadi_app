import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/Screens/addItem/view.dart';
import 'package:projects/Screens/auctionDetails/view.dart';
import 'package:projects/Screens/cities/controller.dart';
import 'package:projects/Screens/cities/model.dart';
import 'package:projects/Screens/currentAuctions/controller.dart';
import 'package:projects/Screens/currentAuctions/model.dart';
import 'package:projects/Screens/drawer/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CityModel _cityModel = CityModel();
  CityController _cityController = CityController();
  CurrentAuctionsModel _currentAuctionsModel = CurrentAuctionsModel();
  CurrentAuctionsController _currentAuctionsController =
      CurrentAuctionsController();
  bool _currentLoading = true;
  bool _cityLoading = true;
  TabController _tabController;
  String _userName, _userEmai, _userImage, _cityName;
  @override
  void initState() {
    _getCurrentAuctions();
    _getCity();
    _getData();
    _tabController = new TabController(
        vsync: DrawerControllerState(), length: 2, initialIndex: 1);
    super.initState();
  }

  _getCurrentAuctions() async {
    _currentAuctionsModel =
        await _currentAuctionsController.getCurrentAuctions();
    setState(() {
      _currentLoading = false;
    });
  }

  _getCity() async {
    _cityModel = await _cityController.getCity();
    setState(() {
      _cityLoading = false;
    });
  }

  _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name');
      _userEmai = prefs.getString('email');
      _userImage = prefs.getString('image');
      _cityName = prefs.getString('cityName');
    });
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
                                        _cityName =
                                            _cityModel.data[index].name.ar;
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

  Widget _card(
      {String image, int id, String title, String address, String detials}) {
    return Material(
      elevation: 1,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AuctionDetails()));
        },
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
                      Expanded(
                          child: Column(
                        children: <Widget>[Text('1/6/2020'), Text('05:40')],
                      )),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            title ?? '',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            address ?? '',
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
                            image: DecorationImage(
                                image: NetworkImage(image ?? '')),
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    detials ?? '',
                    style: TextStyle(color: Colors.black26),
                  )
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddItemView()));
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).accentColor),
              child: Center(
                child: Text(
                  'اضافة سلعة جديدة',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        drawer: drawer(
            context: context,
            userName: _userName,
            userEmailm: _userEmai,
            userImage: _userImage),
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
                      child: InkWell(
                        onTap: () {
                          chooseCountry(context);
                        },
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
                              _cityName ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      TabBar(
                        indicatorColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                        tabs: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Theme.of(context).accentColor),
                            width: 150,
                            height: 50,
                            child: Tab(
                              text: 'المزادات القادمة',
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Theme.of(context).accentColor),
                            width: 150,
                            height: 50,
                            child: Tab(
                              text: 'المزادات الحالية',
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Column(
                              children: <Widget>[_card(), _card(), _card()],
                            ),
                            _currentLoading
                                ? Center(child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount:
                                        _currentAuctionsModel.data.data.length,
                                    itemBuilder: (ctx, index) {
                                      return _card(
                                          image: _currentAuctionsModel
                                              .data.data[index].primaryImage,
                                          address: _currentAuctionsModel
                                              .data.data[index].locationName
                                              .toString(),
                                          detials: _currentAuctionsModel
                                              .data.data[index].details
                                              .toString(),
                                          title: _currentAuctionsModel
                                              .data.data[index].phone);
                                    },
                                  )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
