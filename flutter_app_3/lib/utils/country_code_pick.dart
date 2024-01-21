import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';


void pickerCountryCode({
  required BuildContext context,
  required void Function(Country) onSelect,
}) => showCountryPicker(
  context: context,
  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
  countryFilter: <String>['DE', 'BE', 'DK', 'ES', 'FI', 'FR', 'GR', 'IE', 'IT', 'LU', 'NL','PL', 'PT', 'UK', 'SE', 'US'],
  
  //favorite: <String>['FR', 'BE'],
  
  //Optional. Shows phone code before the country name.
  showPhoneCode: true,
  
  onSelect: (country) {
    PickedCountryCode(
      phoneCode: country.phoneCode, countryCode: country.countryCode, name: country.name
    );
  },
  // Optional. Sets the theme for the country list picker.
  countryListTheme: CountryListThemeData(
    // Optional. Sets the border radius for the bottomsheet.
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40.0),
      topRight: Radius.circular(40.0),
    ),
    
    // Optional. Styles the search field.
    inputDecoration: InputDecoration(
      labelText: 'Search',
      hintText: 'Start typing to search',
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xFF8C98A8).withOpacity(0.2),
        ),
      ),
    ),
    // Optional. Styles the text in the search field
    searchTextStyle: TextStyle(
      color: Colors.blue,
      fontSize: 18,
    ),
  ),
);

class PickedCountryCode {

  final String phoneCode;
  final String countryCode;
  final String name;

  String? getTranslatedName(BuildContext context) {
    return CountryLocalizations.of(context)
        ?.countryName(countryCode: countryCode);
  }

  PickedCountryCode({
    required this.phoneCode,
    required this.countryCode,
    required this.name,
  });

  PickedCountryCode.from({required Map<String, dynamic> json})
      : phoneCode = json['e164_cc'],
        countryCode = json['iso2_cc'],
        name = json['name'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['e164_cc'] = phoneCode;
    data['iso2_cc'] = countryCode;
    data['name'] = name;
    return data;
  }

  bool startsWith(String query, CountryLocalizations? localizations) {
    String _query = query;
    if (query.startsWith("+")) {
      _query = query.replaceAll("+", "").trim();
    }
    return phoneCode.startsWith(_query.toLowerCase()) ||
        name.toLowerCase().startsWith(_query.toLowerCase()) ||
        countryCode.toLowerCase().startsWith(_query.toLowerCase()) ||
        (localizations
                ?.countryName(countryCode: countryCode)
                ?.toLowerCase()
                .startsWith(_query.toLowerCase()) ??
            false);
  }

  @override
  String toString() => 'Country(countryCode: $countryCode, name: $name)';

  @override
  bool operator ==(Object other) {
    if (other is PickedCountryCode) {
      return other.countryCode == countryCode;
    }

    return super == other;
  }

  @override
  int get hashCode => countryCode.hashCode;

  String countryCodeToEmoji(String countryCode) {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

}

