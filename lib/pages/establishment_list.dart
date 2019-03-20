import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/scoped_models/main.dart';
import '../widgets/tile_default.dart';

class EstablishmentListPage extends StatelessWidget {
  Widget buildCard(BuildContext context, int index, MainModel model) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: TileDefault(
            title: model.allEstablishments[index].name,
            subtitle: model.allEstablishments[index].address),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      final buildBody = Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: model.allEstablishments.length,
          itemBuilder: (BuildContext context, int index) {
            return buildCard(context, index, model);
          },
        ),
      );

      

      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: buildBody,
      );
    });
  }
}
