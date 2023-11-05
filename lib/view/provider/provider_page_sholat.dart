import 'package:flutter/material.dart';

class PageSholatProvider extends ChangeNotifier {
  final TextEditingController _cityController = TextEditingController();

  TextEditingController get cityController => _cityController;

  final List<String> _dummy = [
    "imsak",
    "subuh",
    "terbit",
    "dhuha",
    "dzuhur",
    "maghrib",
    'isya',
  ];
  List<String> get dummy => _dummy;

  String _selectedCityId = '600';
  String get selectedCityId => _selectedCityId;
  set selectedCityId(String cityId) {
    _selectedCityId = cityId;
    notifyListeners();
  }
}
