import 'package:aplikasi_bacaan_solat/models/model_jadwal_solat.dart';

import 'package:aplikasi_bacaan_solat/utils/jadwal_solat_utils.dart';
import 'package:aplikasi_bacaan_solat/utils/kota_utils.dart';
import 'package:dio/dio.dart';

class ApiServices {
  // ignore: non_constant_identifier_names
  final Dio_dio = Dio();

  Future<JadwalSolat> fetchData() async {
    try {
      final response = await Dio().get(Utils.baseurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final JadwalSolat jadwalSholatData = JadwalSolat.fromJson(jsonResponse);

        return jadwalSholatData;
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  Future<JadwalSolat> fetcJadwalSholat(String id) async {
    try {
      final response = await Dio().post(Utils.baseurl + id + Utils.uril);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final JadwalSolat jadwalSholatData = JadwalSolat.fromJson(jsonResponse);
        return jadwalSholatData;
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  Future<Map<String, dynamic>> fetchDataKota() async {
    try {
      final response = await Dio()
          .get(Fire.urlKota); 
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  Future<Map<String, dynamic>> fetchJadwalSholat(String id) async {
    try {
      const date = "2023-11-01";
      final response = await Dio().post(Utils.baseurl +
          id +
          Utils.uril +
          date); 
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }
}
