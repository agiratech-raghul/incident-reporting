import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incident_reporting/src/model/country_model.dart';

class AppProvider with ChangeNotifier {
  String? countryCodeId = '234';
  Countries? countries;
  Iterable<Country>? country;

  void changeContryCode(String? value) {
    countryCodeId = value;
    country =
        countries?.countries.where((element) => element.id == countryCodeId);
    notifyListeners();
  }

  Future<void> getCountries() async {
    String rawData =
        await rootBundle.loadString('assets/json/language/country _data.json');
    final parsed = json.decode(rawData);
    final value = Countries.fromJson(parsed);
    countries = value;
    country =
        countries?.countries.where((element) => element.id == countryCodeId);
    notifyListeners();
  }
}
