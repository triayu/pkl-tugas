// import 'package:example/core.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final DateTime? value;

  const DatePicker({
    Key? key,
    required this.label,
    this.value,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late TextEditingController controller;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    var initialValue;
    controller = TextEditingController(text: initialValue);
  }

  // String get initialValue {
  //   return DateFormat("d MMM y").format(widget.value!);
  // }

  // String get formattedValue {
  //   return DateFormat("d MMM y").format(selectedDate!);
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickerDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );

        selectedDate = pickerDate;
        controller.text = selectedDate.toString();
        setState(() {});
      },
      child: TextFormField(
        controller: controller,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: const Icon(
            Icons.date_range,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
