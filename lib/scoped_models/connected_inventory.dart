import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/models/product.dart';
import 'package:Inventarios/models/establishment.dart';

mixin ConnectedInventoryModel on Model {
  List<Establishment> _establishments = [];
  List<Product> _productsx = [];
  int selEstablishmentIndex;
  int selProductIndex;
}

mixin EstablishmentsModel on ConnectedInventoryModel {
  List<Establishment> get allEstablishments {
    return List.from(_establishments);
  }

  int get selectedEstablishmentIndex {
    return selEstablishmentIndex;
  }

  void setSelectedEstablishment(int index) {
    selEstablishmentIndex = index;
    notifyListeners();
  }

  Establishment get selectedEstablishment {
    if (selectedEstablishmentIndex == null) {
      return null;
    }
    return _establishments[selectedEstablishmentIndex];
  }

  void addEstablishment(String name, String address) {
    final Establishment newEstablishment =
        Establishment(name: name, address: address);
    _establishments.add(newEstablishment);
    notifyListeners();
  }

  void updateEstablishment(String name, String address) {
    final Establishment updatedEstablishment =
        Establishment(name: name, address: address);

    _establishments[selEstablishmentIndex] = updatedEstablishment;
    notifyListeners();
  }
}

mixin ProductsModel on ConnectedInventoryModel {
  List<Product> get allProducts {
    return List.from(_productsx);
  }

  int get selectedProductIndex {
    return selProductIndex;
  }

    Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _productsx[selectedProductIndex];
  }

  void addProduct(String name, String description, String imageUrl) {
    final Product newProduct =
        Product(name: name, description: description, imageUrl: imageUrl);
    _productsx.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String name, String description, String imageUrl) {
    final Product updatedProduct =
        Product(name: name, description: description, imageUrl: imageUrl);

    _productsx[selProductIndex] = updatedProduct;
    notifyListeners();
  }

  void setSelectedProduct(int index) {
    selProductIndex = index;
    notifyListeners();
  }
}
