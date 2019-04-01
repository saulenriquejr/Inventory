import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/scoped_models/main.dart';
import 'package:Inventarios/pages/place_admin.dart';
import 'package:Inventarios/pages/product_admin.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: MainModel(),
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple,
            buttonColor: Colors.deepPurple
          ),
          routes: {
            '/': (BuildContext context) => PlaceAdminPage(),
            '/places': (BuildContext context) =>
                PlaceAdminPage(),
            '/products': (BuildContext context) => ProductAdminPage()
          },
        ));
  }
}
