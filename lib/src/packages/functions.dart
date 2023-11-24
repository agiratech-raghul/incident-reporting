import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:incident_reporting/src/model/country_model.dart';

import 'country_code_picker.dart';
import 'package:flutter/services.dart' show rootBundle;

///This function returns list of countries
Future<List<Country>> getCountries(BuildContext context) async {
  final rawData =
      await rootBundle.loadString('assets/json/language/country _data.json');

  final parsed = json.decode(rawData.toString()).cast<Map<String, dynamic>>();

  print(parsed);
  return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  //  String rawData =
  //       await rootBundle.loadString('assets/json/language/country _data.json');
  //   final parsed = json.decode(rawData) as ;
  //   final value = parsed;
}

///This function returns an user's current country. User's sim country code is matched with the ones in the list.
///If there is no sim in the device, first country in the list will be returned.
///This function returns an user's current country. User's sim country code is matched with the ones in the list.
///If there is no sim in the device, first country in the list will be returned.
Future<Country> getDefaultCountry(BuildContext context) async {
  final list = await getCountries(context);
  try {
    final countryCode = await FlutterSimCountryCode.simCountryCode;
    if (countryCode == null) {
      return list.first;
    }
    return list.firstWhere((element) =>
        element.countryCode.toLowerCase() == countryCode.toLowerCase());
  } catch (e) {
    return list.first;
  }
}

///This function returns an country whose [countryCode] matches with the passed one.
Future<Country?> getCountryByCountryCode(
    BuildContext context, String countryCode) async {
  final list = await getCountries(context);
  return list.firstWhere((element) => element.countryCode == countryCode);
}

Future<Country?> showCountryPickerSheet(BuildContext context,
    {Widget? title,
    Widget? cancelWidget,
    double cornerRadius = 35,
    bool focusSearchBox = false,
    double heightFactor = 0.9}) {
  assert(heightFactor <= 0.9 && heightFactor >= 0.4,
      'heightFactor must be between 0.4 and 0.9');
  return showModalBottomSheet<Country?>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cornerRadius),
              topRight: Radius.circular(cornerRadius))),
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * heightFactor,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16),
              Stack(
                children: <Widget>[
                  cancelWidget ??
                      Positioned(
                        right: 8,
                        top: 4,
                        bottom: 0,
                        child: TextButton(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.pop(context)),
                      ),
                  Center(
                    child: title ??
                        const Text(
                          'Choose Region',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: CountryPickerWidget(
                  onSelected: (country) => Navigator.of(context).pop(country),
                ),
              ),
            ],
          ),
        );
      });
}

Future<Country?> showCountryPickerDialog(
  BuildContext context, {
  Widget? title,
  double cornerRadius = 35,
  bool focusSearchBox = false,
}) {
  return showDialog<Country?>(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(cornerRadius),
            )),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                Stack(
                  children: <Widget>[
                    Positioned(
                      right: 8,
                      top: 4,
                      bottom: 0,
                      child: TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context)),
                    ),
                    Center(
                      child: title ??
                          const Text(
                            'Choose Region',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: CountryPickerWidget(
                    onSelected: (country) => Navigator.of(context).pop(country),
                  ),
                ),
              ],
            ),
          ));
}
