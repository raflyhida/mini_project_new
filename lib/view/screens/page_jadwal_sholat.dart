import 'package:aplikasi_bacaan_solat/view/provider/provider_daftar_kota.dart';
import 'package:aplikasi_bacaan_solat/view/provider/provider_page_sholat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageHomeSholat extends StatefulWidget {
  const PageHomeSholat({super.key});

  @override
  State<PageHomeSholat> createState() => _PageHomeSholatState();
}

String? selectedValue;


class _PageHomeSholatState extends State<PageHomeSholat> {

  @override
  Widget build(BuildContext context) {
    final sholatProvider = Provider.of<PageSholatProvider>(context);
    return FutureBuilder<Map<String, dynamic>>(
      future: context.read<JadwalSholatJson>().fetchDataKota(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const Scaffold(
              body:
                  Center(child: Text("Gagal memuat data. Silakan coba lagi.")));
        } else {
          final List<dynamic>? kotaList =
              snapshot.data?['kota'] as List<dynamic>?;

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
                      selectedValue = value;

                      sholatProvider.selectedCityId = kotaList
                          .firstWhere((kota) => kota['nama'] == value)['id'];
                    },
                    items: kotaList!
                        .map<DropdownMenuItem<String>>(
                          (kota) => DropdownMenuItem<String>(
                            value: kota['nama'],
                            child: Text(kota['nama']),
                          ),
                        )
                        .toList(),
                  ),
                  FutureBuilder<Map<String, dynamic>>(
                    future: context
                        .read<JadwalSholatJson>()
                        .fetchJadwalSholat(sholatProvider.selectedCityId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text(
                            "Gagal memuat data jadwal sholat. Silakan coba lagi.");
                      } else {
                        final sholatData = snapshot.data?['jadwal']['data']
                            as Map<String, dynamic>;

                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            itemCount: sholatData.length - 2,
                            itemBuilder: (context, position) {
                              return Container(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        sholatData[
                                            sholatProvider.dummy[position]],
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
                                        sholatProvider.dummy[position],
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
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
