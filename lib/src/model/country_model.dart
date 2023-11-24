// ignore_for_file: public_member_api_docs, sort_constructors_first
class Countries {
  final List<Country> countries;
  Countries({
    required this.countries,
  });
  factory Countries.fromJson(List<dynamic> json) {
    List<Country> countries = json.map((e) => Country.fromJson(e)).toList();

    return Countries(countries: countries);
  }
}

class Country {
  final String name;
  final String flag;
  final String countryCode;
  final String phone;
  final String id;
  final String phoneLength;

  const Country({
    required this.name,
    required this.flag,
    required this.id,
    required this.countryCode,
    required this.phone,
    required this.phoneLength,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['label'] ?? '',
      flag: json['flag'] ?? '',
      countryCode: json['country_code'] ?? '',
      phone: json['phone'] ?? '',
      phoneLength: json['phoneLength'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
