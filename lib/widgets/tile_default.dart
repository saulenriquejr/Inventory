import 'package:flutter/material.dart';

class TileDefault extends StatelessWidget {
  final String title;
  final String subtitle;

  TileDefault({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.home, color: Colors.white),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway'),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.map, color: Theme.of(context).accentColor),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
          )
        ],
      ),
      trailing: Icon(Icons.edit, color: Colors.white, size: 30.0),
    );
  }
}
