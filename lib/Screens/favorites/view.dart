import 'package:flutter/material.dart';
import 'package:projects/Screens/favorites/controller.dart';
import 'package:projects/Screens/favorites/model.dart';

class FavoritesView extends StatefulWidget {
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  FavoritesController _favoritesController = FavoritesController();
  FavoritesModel _favoritesModel = FavoritesModel();
  bool _loading = true;

  @override
  void initState() {
    _getFav();
    super.initState();
  }

  _getFav() async {
    _favoritesModel = await _favoritesController.getFavorites();
    setState(() {
      _loading = false;
    });
  }

  Widget _card(
      {String image, int id, String name, String address, String desc}) {
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
                    Expanded(
                        child: Icon(
                      Icons.notifications,
                      color: Theme.of(context).accentColor,
                    )),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          name ?? '',
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
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  desc ?? '',
                  style: TextStyle(color: Colors.black26),
                )
              ],
            )),
      ),
    );
  }

  Widget _view() {
    return ListView.builder(
      itemCount: _favoritesModel.data.data.length,
      itemBuilder: (ctx, index) {
        return _card(
          address:
              _favoritesModel.data.data[index].auctions[index].locationName,
          desc: _favoritesModel.data.data[index].auctions[index].details,
          id: _favoritesModel.data.data[index].auctions[index].id,
          image: _favoritesModel.data.data[index].auctions[index].primaryImage,
          name: _favoritesModel.data.data[index].auctions[index].name,
        );
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
                      'المفضلة',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          _loading
              ? Center(child: CircularProgressIndicator())
              : Positioned(
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
