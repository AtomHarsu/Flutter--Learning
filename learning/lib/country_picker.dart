import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String? countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Picker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text(
                        "+$countryCode",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              controller: TextEditingController(),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country value) {
                      countryCode = value.phoneCode.toString();
                      setState(() {});
                    },
                  );
                },
                child: Text('Select County And Code')),
          ),
        ],
      ),
    );
  }
}
