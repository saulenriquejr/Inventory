import 'package:scoped_model/scoped_model.dart';

import 'package:Inventarios/models/establishment.dart';

mixin ConnectedEstablishmentModel on Model {
  List<Establishment> _establishments = [];
  int selEstablishmentIndex;
}

mixin EstablishmentsModel on ConnectedEstablishmentModel {

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
