import 'package:aplikasi_bacaan_solat/models/model_jadwal_solat.dart';

import 'package:aplikasi_bacaan_solat/services/jadwal_solat_utils.dart';
// import 'package:aplikasi_bacaan_solat/services/kota_utils.dart';
import 'package:dio/dio.dart';

class ApiServices {
  // ignore: non_constant_identifier_names
  final Dio_dio = Dio();

  // Future<List<JadwalSolat>> fetchData() async {
  //   // JadwalSolat? result;
  //   try {
  //     Response response = await _dio.get(Utils.baseurl);
  //     final List<dynamic> dataJadwal = response.data;
  //     final List<JadwalSolat> sholat = dataJadwal.map((data){return});
  //     result = JadwalSolat.fromJson(response.data);
  //   } catch (error) {
  //     debugPrint('Error fetching data: $error');
  //   }
  //   return result;
  // }
  Future<JadwalSolat> fetchData() async {
    try {
      final response = await Dio().get(Utils.baseurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final JadwalSolat jadwalSholatData = JadwalSolat.fromJson(jsonResponse);
        print(jadwalSholatData);
        return jadwalSholatData;
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  // Map<String, dynamic> dataKota = {};
  // Future<void> fetchDataKota() async {
  //   try {
  //     final response = await Dio().get(Fire.urlKota);
  //     if (response.statusCode == 200) {
  //       // final Map<String, dynamic> jsonResponse = response.data;
  //       // final JadwalSolat jadwalSholatData = JadwalSolat.fromJson(jsonResponse);
  //       // print(jadwalSholatData);
  //       // return jadwalSholatData;
  //      final data = response.data;
  //       dataKota = data;
  //     } else {
  //       throw Exception(
  //           'Gagal mengambil data dari API: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Gagal mengambil data dari API: $error');
  //   }
  // }

  Future<JadwalSolat> fetcJadwalSholat(String id) async {
    try {
      final response = await Dio().post(Utils.baseurl + id + Utils.uril);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final JadwalSolat jadwalSholatData = JadwalSolat.fromJson(jsonResponse);
        print(jadwalSholatData);
        return jadwalSholatData;
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }
}

void main() async {
  await ApiServices().fetchData();
}
