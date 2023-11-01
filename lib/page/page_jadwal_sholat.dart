// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:aplikasi_bacaan_solat/provider/provider_daftar_kota.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PageHomeSholat extends StatefulWidget {
  const PageHomeSholat({super.key});

  @override
  State<PageHomeSholat> createState() => _PageHomeSholatState();
}

String? selectedValue;
final TextEditingController cityController = TextEditingController();

class _PageHomeSholatState extends State<PageHomeSholat> {
  List<String> dummy = [
    "imsak",
    "subuh",
    "terbit",
    "dhuha",
    "dzuhur",
    "maghrib",
    'isya',
  ];
  String selectedCityId = '600';

  List initData = [];
  Map<String, dynamic>? selectedData;
  @override
  Widget build(BuildContext context) {
    final kotaProvider = Provider.of<JadwalSholatJson>(context, listen: false);
    kotaProvider.fetchDataKota();
    final List<dynamic> kotaList = kotaProvider.dataKota['kota'];
    debugPrint('=> $kotaList}');
    kotaProvider.fetcJadwalSholat(selectedCityId);
    // final String id = kotaProvider.dataKota['kota']['id'];
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(

        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/images/logo_jadwalsholat.png'),
            ),
           
            DropdownButton<String>(
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  selectedCityId = kotaList
                      .firstWhere((kota) => kota['nama'] == value)['id'];
                  print("=>  $selectedCityId");
                  kotaProvider.fetcJadwalSholat(selectedCityId);
                });
              },
              items: kotaList
                  .map<DropdownMenuItem<String>>(
                    (kota) => DropdownMenuItem<String>(
                      value: kota['nama'],
                      child: Text(kota['nama']),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Consumer<JadwalSholatJson>(
              builder: (context, modelview, child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: 
                      ListView.builder(
                          itemCount: kotaProvider
                                  .jadwalSholat['jadwal']['data'].length -
                              2,
                          itemBuilder: (context, position) {
                            final Map<String, dynamic> subuh =
                                kotaProvider.jadwalSholat['jadwal']['data'];
                            return Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      subuh[dummy[position]],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      color: Colors.teal[50],
                                    ),
                                    child: Text(
                                      dummy[position],
                                      style: const TextStyle(
                                          color: Colors.teal,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                );
              },
            )
          ],
        ),
     
      ),
    );
  }
}
