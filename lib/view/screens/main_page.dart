import 'package:aplikasi_bacaan_solat/view/screens/arah_kiblat_page.dart';
import 'package:aplikasi_bacaan_solat/view/screens/ayat_kusi_page.dart';
import 'package:aplikasi_bacaan_solat/view/screens/bacaan-sholat_page.dart';

import 'package:aplikasi_bacaan_solat/view/screens/niat_sholat_page.dart';
import 'package:aplikasi_bacaan_solat/view/screens/page_jadwal_sholat.dart';
import 'package:aplikasi_bacaan_solat/view/screens/smartphone.dart';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Aplikasi Bacaan Shalat ",
            style: TextStyle(color: Colors.amber),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: [
              _buildGridItem(
                  context, "assets/images/ic_niat.png", "Niat shalat"),
              _buildGridItem(
                  context, "assets/images/ic_doa.png", "Bacaaan Shalat"),
              _buildGridItem(
                  context, "assets/images/ic_bacaan.png", "Ayat Kursi"),
              _buildGridItem(
                  context, "assets/images/kiblah.png", "Arah Kiblat"),
              _buildGridItem(context, "assets/images/gambar waktu solat.png",
                  "Waktu Sholat"),
              _buildGridItem(
                  context, "assets/images/gambar waktu solat.png", "OPENAI"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath, String text) {
    return InkWell(
      onTap: () {
        switch (text) {
          case "Niat shalat":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NiatSholat()),
            );
            break;
          case "Bacaaan Shalat":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BacaanSholat()),
            );
            break;
          case "Ayat Kursi":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AyatKursi()),
            );
            break;
          case "Arah Kiblat":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Kiblat()),
            );
            break;
          case "Waktu Sholat":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageHomeSholat()),
            );
            break;
          case "OPENAI":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SmartphoneScreen()),
            );
            break;
            
        }
      },
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(imagePath),
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10.0),
            Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
