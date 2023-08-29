import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final List<Map<String, String>> values;
  // final String selectedDropdown;
  // final List<Map<String, dynamic>> checkBox;

  NextPage({
    required this.values,
    // required this.selectedDropdown,
    // required this.checkBox,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Results'),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          return CardItem(
            name: values[index]['name']!,
            alamat: values[index]['alamat']!,
            umur: values[index]['umur']!,
            waktu: values[index]['waktu']!,
            tanggal: values[index]['tanggal']!,
            // pilihanmu: selectedDropdown,
            // check: checkBox[index],
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String alamat;
  final String umur;
  final String waktu;
  final String tanggal;
  // final String pilihanmu;
  // final String check;

  const CardItem({
    Key? key,
    required this.name,
    required this.alamat,
    required this.umur,
    required this.waktu,
    required this.tanggal,
    // required this.pilihanmu,
    // required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Name: $name',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Alamat: $alamat',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Umur: $umur',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Waktu: $waktu',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Tanggal: $tanggal',
            style: TextStyle(color: Colors.black),
          ),
          // Text(
          //   'YourChoice : $pilihanmu',
          //   style: TextStyle(color: Colors.black),
          // ),
        ],
      ),
    );
  }
}
