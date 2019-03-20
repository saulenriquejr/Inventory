import 'package:Inventarios/pages/establishment_edit.dart';
import 'package:Inventarios/pages/establishment_list.dart';
import 'package:flutter/material.dart';

class EstablishmentAdminPage extends StatelessWidget {
  final String title;

  const EstablishmentAdminPage({this.title});

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: topAppBar,
        body: TabBarView(
          children: <Widget>[
            EstablishmentListPage(),
            EstablishmentEditPage()
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
