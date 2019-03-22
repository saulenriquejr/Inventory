import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/pages/establishment_edit.dart';
import 'package:Inventarios/scoped_models/main.dart';

class EstablishmentListPage extends StatelessWidget {
  Widget buildCard(BuildContext context, int index, MainModel model) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
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
            model.allEstablishments[index].name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.map, color: Theme.of(context).accentColor),
              Text(
                model.allEstablishments[index].address,
                style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
              )
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit, color: Colors.white, size: 30.0),
            onPressed: () {
              model.setSelectedEstablishment(index);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return EstablishmentEditPage();
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
        itemCount: model.allEstablishments.length,
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
        backgroundColor: Theme.of(context).primaryColor,
        body: buildBody(context, model),
      );
    });
  }
}
