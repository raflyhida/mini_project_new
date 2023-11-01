// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:aplikasi_bacaan_solat/provider/provider_jadwal_solat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class JadwalSolatWidget extends StatelessWidget {
  const JadwalSolatWidget({
    super.key,
    // required this.jadwalSolat,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JadwalSholatApi>(context);
    provider.fetchData();
    debugPrint(provider.jadwalData?.jadwal.data.subuh);
    debugPrint(provider.jadwalData?.jadwal.data.dhuha);
    debugPrint(provider.jadwalData?.jadwal.data.dzuhur);
    debugPrint(provider.jadwalData?.jadwal.data.imsak);
    debugPrint(provider.jadwalData?.jadwal.data.isya);
    debugPrint(provider.jadwalData?.jadwal.data.maghrib);
    debugPrint(provider.jadwalData?.jadwal.data.subuh);
    debugPrint(provider.jadwalData?.jadwal.data.tanggal);
    debugPrint(provider.jadwalData?.jadwal.data.terbit);

    String asharTime =
        provider.jadwalData?.jadwal.data.ashar ?? 'Not available';
    String dhuhaTime =
        provider.jadwalData?.jadwal.data.dhuha ?? 'Not available';

    String dzuhurTime =
        provider.jadwalData?.jadwal.data.dzuhur ?? 'Not available';
    String imsakTime =
        provider.jadwalData?.jadwal.data.imsak ?? 'Not available';
         String isyaTime =
        provider.jadwalData?.jadwal.data.isya ?? 'Not available';
         String maghribTime =
        provider.jadwalData?.jadwal.data.maghrib ?? 'Not available';
         String subuhTime =
        provider.jadwalData?.jadwal.data.subuh ?? 'Not available';
         String tanggalTime =
        provider.jadwalData?.jadwal.data.tanggal ?? 'Not available';
    String terbitTime =
        provider.jadwalData?.jadwal.data.terbit ?? 'Not available';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Sholat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (provider.jadwalData != null)
              Text(
                'Status: ${provider.jadwalData?.status}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 10),
            const Text(
              'Kota: Bandung',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Jadwal Sholat:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildJadwalSholatItem("Tanggal", tanggalTime),
            Text(
              'Tanggal: ${provider.jadwalData?.query.tanggal}',
              style: const TextStyle(fontSize: 16),
            ),
            _buildJadwalSholatItem('Ashar', asharTime),
            _buildJadwalSholatItem('Dhuha', dhuhaTime),
            _buildJadwalSholatItem('Dzuhur', dzuhurTime),
            _buildJadwalSholatItem('Imsak', imsakTime),
             _buildJadwalSholatItem('Isya', isyaTime),
              _buildJadwalSholatItem('Maghrib', maghribTime),
               _buildJadwalSholatItem('Subuh', subuhTime),
               
                 _buildJadwalSholatItem('Terbit', terbitTime),

            //   ],
            // )
            if (provider.jadwalData == null)
              const Text('Status: Data not available'),
          ],
        ),
      ),
      //   body: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Text(
      //           'Status: ${provider.jadwalData.status}',
      //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),
      //         Text(
      //           'Kota: ${provider.jadwalData.query.kota}',
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //         const SizedBox(height: 10),
      //         Text(
      //           'Tanggal: ${provider.jadwalData.query.tanggal.toString()}',
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //         const SizedBox(height: 20),
      //         const Text(
      //           'Jadwal Sholat:',
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),
      //         _buildJadwalSholatItem(
      //             'Subuh', provider.jadwalData.jadwal.data.subuh),
      //         _buildJadwalSholatItem(
      //             'Dhuha', provider.jadwalData.jadwal.data.dhuha),
      //         _buildJadwalSholatItem(
      //             'Dzuhur', provider.jadwalData.jadwal.data.dzuhur),
      //         _buildJadwalSholatItem(
      //             'Ashar', provider.jadwalData.jadwal.data.ashar),
      //         _buildJadwalSholatItem(
      //             'Maghrib', provider.jadwalData.jadwal.data.maghrib),
      //         _buildJadwalSholatItem(
      //             'Isya', provider.jadwalData.jadwal.data.isya),
      //       ],
      //     ),
      //   ),
    );
  }

  Widget _buildJadwalSholatItem(String sholatName, String sholatTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            sholatName,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            sholatTime,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
