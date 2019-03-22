import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/establishment_admin.dart';
import 'package:Inventarios/scoped_models/main.dart';

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
              primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
              accentColor: Color.fromRGBO(52, 138, 167, 1.0)),
          routes: {
            '/': (BuildContext context) => EstablishmentAdminPage(title: 'Lugares'),
            '/establishments': (BuildContext context) => EstablishmentAdminPage(title: 'Lugares')
          },
        ));
  }
}
