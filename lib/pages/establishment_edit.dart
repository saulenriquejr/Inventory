import 'package:Inventarios/scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/models/establishment.dart';
import 'package:Inventarios/widgets/helpers/ensure_visible.dart';

class EstablishmentEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EstablishmentEditPage();
}

class _EstablishmentEditPage extends State<EstablishmentEditPage> {
  Establishment _formData = new Establishment();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  Widget _buildNameTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _nameFocusNode,
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        focusNode: _nameFocusNode,
        decoration: InputDecoration(
            labelText: 'Nombre del lugar',
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Debe tener al menos 5 letras';
          }
        },
        onSaved: (String value) {
          _formData.name = value;
        },
      ),
    );
  }

  Widget _buildAddressTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _addressFocusNode,
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        focusNode: _addressFocusNode,
        decoration: InputDecoration(
            labelText: 'Dirección',
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
        // validator: (String value) {
        //   if (value.isEmpty || value.length < 5) {
        //     return 'Debe tener al menos 5 letras';
        //   }
        // },
        onSaved: (String value) {
          _formData.address = value;
        },
      ),
    );
  }

  void _submitForm(Function addEstablishment) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    addEstablishment(_formData.name, _formData.address);

    Navigator.pushReplacementNamed(context, '/');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return RaisedButton(
          child: Text('Guardar'),
          textColor: Colors.white,
          color: Theme.of(context).accentColor,
          onPressed: () => _submitForm(model.addEstablishment),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildNameTextField(),
              _buildAddressTextField(),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: _buildPageContent(context));
    });
  }
}
