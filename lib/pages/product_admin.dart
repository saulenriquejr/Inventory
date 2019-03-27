import 'package:flutter/material.dart';

import 'package:Inventarios/pages/product_edit.dart';
import 'package:Inventarios/pages/product_list.dart';
import 'package:Inventarios/widgets/side_menu.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
        elevation: 0.1,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Productos'));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: SideMenu(),
        backgroundColor: Theme.of(context).primaryColor,
        appBar: topAppBar,
        body: TabBarView(
          children: <Widget>[ProductListPage(), ProductEditPage()],
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
