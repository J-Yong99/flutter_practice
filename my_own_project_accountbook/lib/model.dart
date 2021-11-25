import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  String? name;
  int? cost;
  Model(this.name, this.cost);
  void pay(int num) {
    cost = cost! + num;
    notifyListeners();
  }
}
