import 'package:flutter/material.dart';
import 'package:prospect/screens/ui_register/ui_register.dart';
import 'package:prospect/text_input/text_input.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.title});
  final String title;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.home),
      //   ),
      //   title: const Text('Vivi '),
      // ),
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
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(50),
                  child: Image.asset(
                    'img/galkasoft.jpeg',
                  )),
            ),
            Container(
              child: TextInput(
                title: 'Nama',
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
            // SizedBox(height: 60),
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
                        MaterialPageRoute(builder: (context) => RegisterView()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  "Register",
                  // style: tncTextStyle.copyWith(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
