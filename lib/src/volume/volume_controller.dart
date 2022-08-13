import 'package:flutter/material.dart';
import 'package:better_price_flutter/src/volume/volume_model.dart';

class VolumeController extends ChangeNotifier {
  List<VolumeModel> products = [VolumeModel('1', 'ml'), VolumeModel('2', 'ml')];

  add() {
    products.add(VolumeModel('${products.length + 1}', 'ml'));
    notifyListeners();
  }
}
