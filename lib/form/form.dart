import 'package:flutter/material.dart';
import 'package:prospect/form/checkbox.dart';
import 'package:prospect/form/dropdown.dart';
import 'package:prospect/form/next_page.dart';
import 'package:prospect/form/timepicker.dart';
import 'package:prospect/form/textfield.dart';
import 'datepicker.dart';
import 'validator.dart';
import 'package:intl/intl.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formState = GlobalKey<FormState>();

  Map<String, dynamic> values = {
    "name": TextEditingController(),
    "alamat": TextEditingController(),
    "umur": TextEditingController(),
    "waktu": '',
    "tanggal": '',
    // "dropdown": ''
    // "check":'',
  };

  List<Map<String, String>> listArray = [];

  void onTap() {
    if (_formState.currentState!.validate()) {
      String nameText = values["name"]?.text ?? '';
      String alamatText = values["alamat"]?.text ?? '';
      String umurText = values["umur"]?.text ?? '';
      String waktuDate = values["waktu"];
      String tanggal = values["tanggal"];
      // String checkBox = values["check"];

      listArray.add({
        'name': nameText,
        'alamat': alamatText,
        'umur': umurText,
        'waktu': waktuDate,
        'tanggal': tanggal,
        // 'check': checkBox,
      });

      values["name"]?.clear();
      values["alamat"]?.clear();
      values["umur"]?.clear();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NextPage(
            values: listArray,
            // selectedDropdown: values['dropdown'] ?? '',
          ),
        ),
      );
    }
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formattedTime = TimeOfDay.fromDateTime(dateTime).format(context);

    return formattedTime;
  }

  String formatDateTime(DateTime dateTime) {
    final format = DateFormat('yyyy-MM-dd HH:mm');
    return format.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form View'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formState,
            child: Column(
              children: [
                TextFieldView(
                  label: "Name",
                  value: values["name"]?.text ?? '',
                  validator: Validator.required,
                  onChanged: (value) {
                    values["name"]?.text = value;
                  },
                ),
                TextFieldView(
                  label: "Alamat",
                  value: values["alamat"]?.text ?? '',
                  validator: Validator.required,
                  onChanged: (value) {
                    values["alamat"]?.text = value;
                  },
                ),
                TextFieldView(
                  label: "Umur",
                  value: values["umur"]?.text ?? '',
                  validator: Validator.required,
                  onChanged: (value) {
                    values["umur"]?.text = value;
                  },
                ),
                TimePicker(
                  label: "Waktu",
                  value: TimeOfDay.now(),
                  onChanged: (p0) {
                    values['waktu'] = formatTimeOfDay(p0);
                  },
                ),
                DatePicker(
                  label: "Tanggal",
                  value: DateTime.now(),
                  onChanged: (p0) {
                    values['tanggal'] = formatDateTime(p0);
                  },
                ),
                // DropdownPicker(
                //   label: "Dropdown",
                //   options: ['Optimis', 'Berjuang', 'Menyerah'],
                //   onChanged: (value) {
                //     setState(() {
                //       values['dropdown'] = value;
                //     });
                //   },
                //   value: values['dropdown'],
                // ),
                // CheckBox(
                //   id: "checkbox_id",
                //   label: "Checkbox Label",
                //   items: [
                //     {"label": "Item 1"},
                //     {"label": "Item 2"},
                //     {"label": "Item 3"},
                //   ],
                //   validator: (items) {
                //     if (!items.any((item) => item['checked'] ?? false)) {
                //       return "Please select at least one item";
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     print(value);
                //   },

                //   // onChanged: (items) {
                //   //   // setState(() {
                //   //   //   values['checkboxes'] = items;
                //   //   // });
                //   // },
                // ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onTap,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
