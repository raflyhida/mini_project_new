import 'package:aplikasi_bacaan_solat/services/jadwal_solat_utils.dart';
import 'package:aplikasi_bacaan_solat/services/kota_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class JadwalSholatJson extends ChangeNotifier {
  Map<String, dynamic> dataKota = {};
  Map<String, dynamic> jadwalSholat = {};
  bool isLoading = false;
  JadwalSholatJson() {
    fetchDataKota();
  }

  Future<void> fetchDataKota() async {
    try {
      final response = await Dio().get(Fire.urlKota);
      if (response.statusCode == 200) {
        final data = response.data;
        dataKota = data;
        print(dataKota);
        notifyListeners();
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  Future<void> fetcJadwalSholat(String id) async {
    // final currentTime = DateTime.now();
    final date = "2023-11-01";
    // '${currentTime.year}-${currentTime.month.toString().padLeft(2, '0')}-${currentTime.day.toString().padLeft(2, '0')}';
    print('=> $date');
    try {
      isLoading = true;
      final response = await Dio().post(Utils.baseurl + id + Utils.uril + date);

      if (response.statusCode == 200) {
        final data = response.data;
        jadwalSholat = data;
   
        print(jadwalSholat);
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }
}
