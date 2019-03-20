import 'package:Inventarios/models/establishment.dart';
import 'package:Inventarios/widgets/helpers/ensure_visible.dart';
import 'package:flutter/material.dart';

class EstablishmentEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EstablishmentEditPage();
}

class _EstablishmentEditPage extends State<EstablishmentEditPage> {
  Establishment _formData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  Widget _buildNameTextField(BuildContext context) {
    return EnsureVisibleWhenFocused(
      focusNode: _nameFocusNode,
      child: TextFormField(
        //style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  Widget _buildAddressTextField(BuildContext context) {
    return EnsureVisibleWhenFocused(
      focusNode: _addressFocusNode,
      child: TextFormField(
        //style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        focusNode: _addressFocusNode,
        decoration: InputDecoration(
            labelText: 'Dirección',
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Debe tener al menos 5 letras';
          }
        },
        onSaved: (String value) {
          _formData.address = value;
        },
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
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
              _buildNameTextField(context),
              _buildAddressTextField(context),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Guardar'),
                textColor: Colors.white,
                color: Theme.of(context).accentColor,
                onPressed: () => _submitForm(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _buildPageContent(context));
  }
}
