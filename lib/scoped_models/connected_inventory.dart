import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/models/product.dart';
import 'package:Inventarios/models/place.dart';

mixin ConnectedInventoryModel on Model {
  List<Place> _places = [];
  List<Product> _products = [];
  int selPlaceIndex;
  int selProductIndex;
}

mixin PlacesModel on ConnectedInventoryModel {
  List<Place> get allPlaces {
    return List.from(_places);
  }

  int get selectedPlaceIndex {
    return selPlaceIndex;
  }

  void setSelectedPlace(int index) {
    selPlaceIndex = index;
    notifyListeners();
  }

  Place get selectedPlace {
    if (selectedPlaceIndex == null) {
      return null;
    }
    return _places[selectedPlaceIndex];
  }

  void addPlace(String name, String address) {
    final Place newPlace =
        Place(name: name, address: address);
    _places.add(newPlace);
    notifyListeners();
  }

  void updatePlace(String name, String address) {
    final Place updatedPlace =
        Place(name: name, address: address);

    _places[selPlaceIndex] = updatedPlace;
    notifyListeners();
  }
}

mixin ProductsModel on ConnectedInventoryModel {
  List<Product> get allProducts {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return selProductIndex;
  }

    Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  void addProduct(String name, String description, String imageUrl, String category) {
    final Product newProduct =
        Product(name: name, description: description, imageUrl: imageUrl, category: category);
    _products.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String name, String description, String imageUrl, String category) {
    final Product updatedProduct =
        Product(name: name, description: description, imageUrl: imageUrl, category: category);

    _products[selProductIndex] = updatedProduct;
    notifyListeners();
  }

  void setSelectedProduct(int index) {
    selProductIndex = index;
    notifyListeners();
  }
}
