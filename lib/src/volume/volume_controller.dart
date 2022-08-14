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
}
