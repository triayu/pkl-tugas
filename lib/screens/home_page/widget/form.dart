import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  // Show time picker Method
  void _ShowTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Vivi"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                maxLength: 20,
                decoration: const InputDecoration(
                  hintText: 'Tulis Nama Anda',
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                  helperText: "What's Your Name?",
                ),
                onChanged: (value) {},
              ),
              TextFormField(
                maxLength: 20,
                decoration: const InputDecoration(
                  hintText: 'Tulis Email Anda',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
              Container(
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      activeColor: Colors.amber,
                      title: Text('ChecBoxListTile'),
                      subtitle: Text("Vivi"),
                    ),
                    RadioListTile(
                      value: true,
                      groupValue: AboutListTile,
                      onChanged: (value) {},
                      activeColor: Colors.blueAccent,
                      title: Text('Radio List Tile'),
                      subtitle: Text("Belajar Form"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2050),
                        );
                      },
                      icon: const Icon(Icons.calendar_view_day_rounded),
                      label: const Text('Choose Date'),
                    ),
                    MaterialButton(
                      onPressed: _ShowTimePicker,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'TimePicker',
                          style: TextStyle(
                            color: Colors.white,
                          
                            fontSize: 20,
                          ),
                        ),
                      ),
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
