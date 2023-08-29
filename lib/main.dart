import 'package:flutter/material.dart';
import 'package:prospect/form/form.dart';
import 'package:prospect/screens/latihan.dart';
import 'package:prospect/text_input/text_input.dart';

import 'screens/ui_login/login.dart';
import 'screens/ui_register/ui_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: FormView());
  }
}


  // Container(
  //             padding: EdgeInsets.all(10),
  //             margin: EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.green[600],
  //             ),
  //             child: Text(
  //               'Finsh daily goal',
  //               style: TextStyle(fontSize: 15, color: Colors.white),
  //               textAlign: TextAlign.center,
  //             )),
