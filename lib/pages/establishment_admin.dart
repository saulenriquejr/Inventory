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
        title: Text(title));

    Widget _buildDrawer(BuildContext context) {
      return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Menú'),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Lugares'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/establishments');
              },
            )
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        backgroundColor: Theme.of(context).primaryColor,
        appBar: topAppBar,
        body: TabBarView(
          children: <Widget>[EstablishmentListPage(), EstablishmentEditPage()],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.list),
              text: 'Todos',
            ),
            Tab(
              icon: Icon(Icons.add),
              text: 'Agregar nuevo',
            )
          ],
        ),
      ),
    );
  }
}
