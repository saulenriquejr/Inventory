import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/models/establishment.dart';

mixin ConnectedEstablishmentModel on Model {
  List<Establishment> _establishments = [];
  int _selEstablishmentIndex;

  void addEstablishment(String name, String address) {
    final Establishment newEstablishment =
        Establishment(name: name, address: address);
    _establishments.add(newEstablishment);
    notifyListeners();
  }
}

mixin EstablishmentsModel on ConnectedEstablishmentModel {
  List<Establishment> get allEstablishments {
    return List.from(_establishments);
  }
}

