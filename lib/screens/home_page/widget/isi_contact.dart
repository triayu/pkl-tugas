import 'package:flutter/material.dart';
// import 'package:prospect/screens/home_page/widget/setting.dart';

// ignore: must_be_immutable
class ContactView extends StatefulWidget {
  ContactView({super.key});

  List<String> text = ['Test 1'];

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KontakYa"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            widget.text.add('Test ');
          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SettingView()),
          // );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.text.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('img/gambar1.png'),
                        ),
                        title: const Text("Tri Ayu Novitasari"),
                        subtitle: const Text("Mahasiswa"),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
