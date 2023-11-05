import 'dart:convert';

import 'package:aplikasi_bacaan_solat/models/model_niat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NiatSholatProvider extends ChangeNotifier {
  late List<ModelNiat> data = [];
// ignore: non_constant_identifier_names
  Future<void> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/data/niatshalat.json');
    final list = json.decode(jsondata) as List<dynamic>;
    data = list.map((e) => ModelNiat.fromJson(e)).toList();
    notifyListeners();
  }
  
} 
