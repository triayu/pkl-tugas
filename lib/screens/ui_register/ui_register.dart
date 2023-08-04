import 'package:flutter/material.dart';
import 'package:prospect/screens/home_page/home.dart';
// import 'package:prospect/screens/ui_register/ui_register.dart';
import 'package:prospect/text_input/text_input.dart';
// import 'package:prospect/text_input/registerview.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                print('String');
              },
              child: Container(
                  width: 500,
                  height: 200,
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    'img/galkasoft.jpeg',
                  )),
            ),
            Container(
              child: TextInput(
                title: ' Nama',
                hint: 'Masukkan Nama Anda',
                onChanged: (val) {
                  print(val);
                },
              ),
            ),
            Container(
              child: TextInput(
                title: 'Email',
                hint: 'Masukkan Email Anda',
              ),
            ),
            Container(
              child: TextInput(
                title: 'Kode Referal',
                hint: 'Masukkan Kode Refefal Anda',
              ),
            ),
            Row(
              children: [
                Text(
                  "Lupa Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  "Ubah Password",
                  // style: tncTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 0, 47, 255))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
