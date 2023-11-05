import 'package:aplikasi_bacaan_solat/view/provider/provider_arah_kiblat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:provider/provider.dart';

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
    final arahKiblatProvider = Provider.of<ArahKiblatProvider>(context);
    arahKiblatProvider.checkSupport();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _deviceSupport,
          builder: (context, snapshot) {
            return arahKiblatProvider.buildWidget(snapshot);
          },
        ),
      ),
    );
  }
}
