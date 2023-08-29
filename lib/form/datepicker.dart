// import 'package:example/core.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final DateTime? value;
  final void Function(DateTime)? onChanged;
  DatePicker({Key? key, required this.label, this.value, this.onChanged})
      : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late TextEditingController controller;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    selectedDate = widget.value;
    if (selectedDate != null) {
      controller.text = formattedValue;
    }
  }

  String get formattedValue {
    return DateFormat("d MMM y").format(selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickerDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );

        if (pickerDate != null) {
          selectedDate = pickerDate;
          controller.text = formattedValue;
          widget.onChanged?.call(selectedDate!);
          setState(() {});
        }
      },
      child: TextFormField(
        controller: controller,
        maxLength: 20,
        enabled: false,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          suffixIcon: const Icon(
            Icons.date_range,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
