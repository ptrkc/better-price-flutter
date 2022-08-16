import 'package:flutter/material.dart';
import 'package:better_price_flutter/src/volume/volume_model.dart';

class VolumeController extends ChangeNotifier {
  int count = 2;
  List<VolumeModel> products = [VolumeModel(1, 'ml'), VolumeModel(2, 'ml')];

  add() {
    count++;
    products.add(VolumeModel(count, 'ml'));
    notifyListeners();
  }

  removeById(int id) {
    products.removeWhere((prod) => prod.id == id);
    if (products.isEmpty) {
      count = 0;
      return add();
    }
    notifyListeners();
  }

  setNameById(int id, String value) {
    var product = products.firstWhere((prod) => prod.id == id);
    product.name = value;
    notifyListeners();
  }

  setQuantityById(int id, String value) {
    var product = products.firstWhere((prod) => prod.id == id);
    product.quantity = double.tryParse(value) ?? 0;
    notifyListeners();
  }

  setPriceById(int id, String value) {
    var product = products.firstWhere((prod) => prod.id == id);
    product.price = double.tryParse(value) ?? 0;
    notifyListeners();
  }

  setUnitById(int id, String value) {
    var product = products.firstWhere((prod) => prod.id == id);
    product.unit = value;
    notifyListeners();
  }

  pricePerLiter(int id) {
    final product = products.firstWhere((prod) => prod.id == id);
    final liter =
        product.unit == 'ml' ? product.quantity / 1000 : product.quantity;
    final finalPrice = product.price / liter;
    return finalPrice.isNaN ? '' : 'R\$ ${finalPrice.toStringAsFixed(3)}';
  }
}
