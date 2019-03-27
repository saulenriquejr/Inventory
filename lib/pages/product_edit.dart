import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:Inventarios/widgets/helpers/ensure_visible.dart';

import 'package:Inventarios/scoped_models/main.dart';
import 'package:Inventarios/models/product.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductEditPage();
}

class _ProductEditPage extends State<ProductEditPage> {
  Product _productFormData = new Product();
  final GlobalKey<FormState> _productFormKey = GlobalKey<FormState>();

  final _productNameFocusNode = FocusNode();
  final _productDescriptionFocusNode = FocusNode();

  Widget _buildNameTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _productNameFocusNode,
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        focusNode: _productNameFocusNode,
        decoration: InputDecoration(
            labelText: 'Nombre',
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Debe tener al menos 3 letras';
          }
        },
        initialValue: product == null ? '' : product.name,
        onSaved: (String value) {
          _productFormData.name = value;
        },
      ),
    );
  }

  Widget _buildDescripionTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _productDescriptionFocusNode,
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        focusNode: _productDescriptionFocusNode,
        decoration: InputDecoration(
          labelText: 'Descripción',
          labelStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        initialValue: product == null ? '' : product.description,
        onSaved: (String value) {
          _productFormData.description = value;
        },
      ),
    );
  }

  void _submitForm(
      Function addProduct, Function updateProduct, Function setSelectedProduct,
      [int selProductIndex]) {
    if (!_productFormKey.currentState.validate()) {
      return;
    }
    _productFormKey.currentState.save();

    if (selProductIndex == null) {
      addProduct(_productFormData.name, _productFormData.description, _productFormData.imageUrl);
    } else {
      updateProduct(_productFormData.name, _productFormData.description, _productFormData.imageUrl);
    }

    Navigator.pushReplacementNamed(context, '/products')
        .then((_) => setSelectedProduct(null));
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return RaisedButton(
          child: Text('Guardar'),
          textColor: Colors.white,
          color: Theme.of(context).accentColor,
          onPressed: () => _submitForm(model.addProduct, model.updateProduct,
              model.setSelectedProduct, model.selProductIndex),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product product) {
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
          key: _productFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildNameTextField(product),
              _buildDescripionTextField(product),
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
      Widget pageContent = _buildPageContent(context, model.selectedProduct);

      return model.selectedProductIndex == null
          ? pageContent
          : Scaffold(
              appBar: AppBar(
                title: Text('Editar Producto'),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              body: pageContent,
            );
    });
  }
}
