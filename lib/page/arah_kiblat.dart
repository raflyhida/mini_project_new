import 'package:aplikasi_bacaan_solat/page/qiblah_compass.dart';
import 'package:flutter/material.dart';

import 'package:flutter_qiblah/flutter_qiblah.dart';

void main() => runApp(const Kiblat());

class Kiblat extends StatefulWidget {
  const Kiblat({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KiblatState createState() => _KiblatState();
}

class _KiblatState extends State<Kiblat> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.data!) {
              return const QiblahCompass();
            } else {
              return const Center(
                child: Text("Your device is not supported"),
              );
            }
          },
        ),
      ),
    );
  }
}
