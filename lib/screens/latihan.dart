import 'package:flutter/material.dart';

class latihanView extends StatefulWidget {
  const latihanView({super.key});

  @override
  State<latihanView> createState() => _latihanViewState();
}

class _latihanViewState extends State<latihanView> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isTap = !isTap;
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: isTap
            ? ElevatedButton(
                onPressed: () {},
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              )
            : Text('Vivi'),
      ),
    );
  }
}
