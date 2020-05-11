import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/home/home_controller.dart';
import 'package:marvel_api/app/repositories/db_helper.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key key, this.title = "Favorites"}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ModularState<FavoritesPage, HomeController> {
  //use 'controller' variable to access controller

  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.getFavorites().then((list) {
      controller.favorites = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.star), onPressed: () {}),
                  Observer(builder: (_) {
                    return Text('${controller.favorites.length}');
                  })
                ],
              ),
            )
          ],
          backgroundColor: Color(0xffed1d24),
          centerTitle: true,
          title: Text('Your favorites'),
        ),
        body: Observer(
          builder: (_) {
            return Observer(
              builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/app/assets/thanoswpp.jpg'),
                          fit: BoxFit.cover)),
                  child: ListView.builder(
                    itemCount: controller.favorites.length,
                    itemBuilder: (_, index) {
                      var list = controller.favorites;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          //color: Color(0xff1011334),
                          color: Colors.white70,
                          child: ListTile(
                            leading: Container(
                              width: 52,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${list[index].thumbnailExt}'))),
                            ),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Color(0xffed1d24),
                                ),
                                onPressed: () {
                                  db.removeFavorite(list[index]);
                                  db.getFavorites().then((list) {
                                    controller.favorites = list;
                                  });
                                }),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text('${list[index].name}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'ComicRegular')),
                            ),
                            subtitle: list[index].description.isEmpty
                                ? Text("No description available",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Marvel',
                                      fontSize: 17,
                                    ))
                                : Text('${list[index].description}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Marvel',
                                      fontSize: 17,
                                    )),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
