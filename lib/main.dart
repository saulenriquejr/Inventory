import 'package:flutter/material.dart';

import './pages/establishment_admin.dart';

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
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        accentColor: Color.fromRGBO(52, 138, 167, 1.0)
      ),
      routes: {
        '/': (BuildContext context) => EstablishmentAdminPage(title: 'Establecimientos')
      },
    );
  }
}