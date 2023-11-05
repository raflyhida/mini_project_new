import 'dart:io';

import 'package:aplikasi_bacaan_solat/services/api_services.dart';
import 'package:flutter/material.dart';

class JadwalSholatJson extends ChangeNotifier {
  final sholat = ApiServices();

  Future<Map<String, dynamic>> fetchDataKota() async {
    try {
      final response = await sholat.fetchDataKota();
      return response;
    } catch (error) {
      return {'statusCode': HttpStatus.internalServerError};
    }
  }

  Future<Map<String, dynamic>> fetchJadwalSholat(String id) async {
    try {
      final response = await sholat.fetchJadwalSholat(id);
      return response;
    } catch (error) {
      return {'statusCode': HttpStatus.internalServerError};
    }
  }

}
