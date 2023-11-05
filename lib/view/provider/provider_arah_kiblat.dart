import 'package:aplikasi_bacaan_solat/view/screens/qiblah_compass.dart';
import 'package:flutter/material.dart';

class ArahKiblatProvider extends ChangeNotifier {
  bool? _isSupported;
  bool get isSupported => _isSupported ?? false;

  Future<void> checkSupport() async {
    _isSupported = await checkSupportBool();
    notifyListeners();
  }

  Future<bool> checkSupportBool() async {
    return true;
  }

   Widget buildWidget(AsyncSnapshot<bool?> snapshot) {
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
    if (isSupported) {
      return const QiblahCompass();
    } else {
      return const Center(
        child: Text("Your device is not supported"),
      );
    }
  }
}
