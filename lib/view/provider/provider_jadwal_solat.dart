import 'package:aplikasi_bacaan_solat/models/model_jadwal_solat.dart';
import 'package:aplikasi_bacaan_solat/services/api_services.dart';
import 'package:flutter/material.dart';

class JadwalSholatApi extends ChangeNotifier {
  final sholat = ApiServices();
  JadwalSolat? jadwalData;

  Future<void> fetchData() async {
    try {
      final data = await sholat.fetchData();
      jadwalData = data;
      debugPrint(jadwalData?.query.kota);
      notifyListeners();
    } catch (error) {
      debugPrint("Error: $error");
    }
    notifyListeners();
  }
}
