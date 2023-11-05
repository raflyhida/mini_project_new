import 'dart:convert';

import 'package:aplikasi_bacaan_solat/models/model_bacaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BacaanSholatProvider extends ChangeNotifier {
  late List<ModelBacaan> data = [];
  // ignore: non_constant_identifier_names
  Future<void> readJsonData() async {
    final jsondata =
        await rootBundle.loadString('assets/data/bacaanshalat.json');
    final list = json.decode(jsondata) as List<dynamic>;
    data = list.map((e) => ModelBacaan.fromJson(e)).toList();
    notifyListeners();
  }
}
