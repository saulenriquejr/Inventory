import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/scoped_models/main.dart';
import 'package:Inventarios/pages/place_edit.dart';

class PlaceListPage extends StatelessWidget {
  Widget buildCard(BuildContext context, int index, MainModel model) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).accentColor),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child: Icon(Icons.home, color: Colors.white),
          ),
          title: Text(
            model.allPlaces[index].name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.map, color: Colors.white),
              Text(
                model.allPlaces[index].address,
                style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
              )
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit, color: Colors.white, size: 30.0),
            onPressed: () {
              model.setSelectedPlace(index);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PlaceEditPage();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, MainModel model) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.allPlaces.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(context, index, model);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        body: buildBody(context, model),
      );
    });
  }
}
