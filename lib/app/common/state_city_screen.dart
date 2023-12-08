import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';

class StateCityScreen extends StatefulWidget {
  const StateCityScreen({super.key});

  @override
  State<StateCityScreen> createState() => _StateCityScreenState();
}

class _StateCityScreenState extends State<StateCityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State city picker"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("CSC Picker"),
          SizedBox(height: 20),
          CSCPicker(
            layout: Layout.vertical,
            onCountryChanged: (value) {
              print("state==$value");
            },
            onStateChanged: (value) {
              print("city==$value");
            },
            onCityChanged: (value) {
              print("country==$value");
            },
          ),
          SizedBox(height: 20),
          OutlinedButton(
              onPressed: _openCountryPickerDialog,
              child: Text("country_pickers "))
        ],
      ),
    );
  }

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor: Colors.pinkAccent,
              searchInputDecoration: InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: Text('Select your phone code'),
              onValuePicked: (Country country) {
                print("pick country--$country");
              },
              itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('TR'),
                CountryPickerUtils.getCountryByIsoCode('US'),
              ],
              itemBuilder: (country) {
                return Row(
                  children: [
                    CountryPickerUtils.getDefaultFlagImage(country),
                    SizedBox(
                      width: 10,
                    ),
                    Text(country.phoneCode),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(child: Text(country.name)),
                  ],
                );
              },
            )),
      );
}
