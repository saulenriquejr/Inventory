import 'package:flutter/material.dart';
import '../widgets/tile_default.dart';
import '../widgets/navigation_bar.dart';

class EstablishmentListPage extends StatefulWidget {

  @override
  _EstablishmentListPageState createState() => _EstablishmentListPageState();
}

class _EstablishmentListPageState extends State<EstablishmentListPage> {
  @override
  Widget build(BuildContext context) {

    final buildCard = Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: TileDefault(title: 'Bar PEVAAR', subtitle: 'Calle 68 # 12 - 32'),
      ),
    );

    final buildBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return buildCard;
        },
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: buildBody,
    );
  }
}
