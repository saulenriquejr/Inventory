import 'package:flutter/material.dart';

import 'package:Inventarios/pages/product_edit.dart';
import 'package:Inventarios/pages/product_list.dart';
import 'package:Inventarios/widgets/side_menu.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      title: Text('Productos'),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: SideMenu(),
        appBar: topAppBar,
        body: TabBarView(
          children: <Widget>[ProductListPage(), ProductEditPage()],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: Container(
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.gps_fixed),
                  text: 'Todos',
                ),
                Tab(
                  icon: Icon(Icons.add),
                  text: 'Agregar nuevo',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
