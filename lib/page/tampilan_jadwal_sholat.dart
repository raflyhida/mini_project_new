// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class JadwalSholatTampil extends StatefulWidget {
  const JadwalSholatTampil({super.key});

  @override
  State<JadwalSholatTampil> createState() => _JadwalSholatTampilState();
}

class _JadwalSholatTampilState extends State<JadwalSholatTampil> {
  final apiUrl =
      'https://api.banghasan.com/sholat/format/json/jadwal/kota/679/tanggal/2023-10-23';
  final Dio _dio = Dio();
  Map<String, dynamic>? jadwal;

  Future<void> fetchData() async {
    try {
      Response response = await _dio.get(apiUrl);
      setState(() {
        jadwal = response.data['jadwal']['data'];
      });
    } catch (error) {
      debugPrint('Error fetching data: $error');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (jadwal != null)
              Column(
                children: [
                  Text('Fajr: ${jadwal!['subuh']}'),
                  Text('Dhuhr: ${jadwal!['dzuhur']}'),
                  Text('Asr: ${jadwal!['ashar']}'),
                  Text('Maghrib: ${jadwal!['maghrib']}'),
                  Text('Isha: ${jadwal!['isya']}'),
                ],
              )
            else
              const Center(
                child: Text('Data Jadwal Sholat tidak tersedia'),
              ),
          ],
        ),
      ),
    );
  }
}
