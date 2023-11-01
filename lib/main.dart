import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aplikasi_bacaan_solat/provider/provider_bacaan_solat.dart';
import 'package:aplikasi_bacaan_solat/provider/provider_daftar_kota.dart';

import 'package:aplikasi_bacaan_solat/provider/provider_jadwal_solat.dart';
import 'package:aplikasi_bacaan_solat/provider/provider_niat_sholat.dart';
import 'package:aplikasi_bacaan_solat/screens/main_page.dart';

//import 'package:aplikasi_bacaan_solat/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
 
 

  // await ApiServices().fetchData();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<JadwalSholatApi>(
            create: (context) => JadwalSholatApi(),
          ),
          ChangeNotifierProvider(
            create: (_) => NiatSholatProvider(),
          ),
          ChangeNotifierProvider(create: (_) => BacaanSholatProvider()),
          ChangeNotifierProvider(create: (_) => JadwalSholatJson()),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen())),
  );
   final dataKotaJson = JadwalSholatJson();
   await dataKotaJson.fetchDataKota();
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/sholat_bersama.png',
              fit: BoxFit.contain, // Menyesuaikan gambar dengan batas layar
            ),
          ),
          const Text(
            'Prayer Times',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      backgroundColor: Colors.blue,
      nextScreen: const MyApp(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainPage());
  }
}
