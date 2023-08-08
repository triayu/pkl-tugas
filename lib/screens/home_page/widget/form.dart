import 'package:flutter/material.dart';
import 'package:prospect/form_input/form_input.dart';
import 'package:prospect/screens/home_page/widget/datepicker.dart';
import 'package:prospect/screens/home_page/widget/textarea.dart';
import 'package:prospect/screens/home_page/widget/timepicker.dart';
import 'package:prospect/screens/home_page/widget/validator.dart';
import 'package:prospect/text_input/text_input.dart';
import 'package:prospect/widget/custom_widget.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  // void _ShowTimePicker() {
  //   showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Form',
        canBack: false,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DatePicker(
                    label: "Start at",
                    value: DateTime.now(),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: DatePicker(
                    label: "End at",
                    value: DateTime.now(),
                  ),
                ),
              ],
            ),
            // const TimePicker(
            //   label: "Working hours",
            //   value: TimeOfDay(
            //     hour: 13,
            //     minute: 30),
            // ),
            TextArea(
              label: "Memo",
              value: "-",
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Save"),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                // bool isValid = controller.formKey.currentState.validate()
              },
            )
          ],
          // key: controller.formKey,
          // child: Column(
          //   children: [
          //     TextInput(
          //       title: 'Email',
          //       validator: (val) {
          //         Validator.email(val);
          //       },
          //     ),
          //   ],
          // ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(50),
        height: 30,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueAccent,
          boxShadow: [
            BoxShadow(blurStyle: BlurStyle.inner),
          ],
        ),
      ),
    );
  }
}
