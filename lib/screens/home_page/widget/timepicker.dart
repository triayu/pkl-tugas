// import 'package:example/core.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final String label;
  final TimePicker? value;

  const TimePicker({
    Key? key,
    required this.label,
    this.value,
  }) : super(key: key);

  get hour => null;

  get minute => null;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

abstract class _TimePickerState extends State<TimePicker> {
  late TextEditingController controller;
  TimeOfDay? selectedDate;

  @override
  void initState() {
    super.initState();
    var initialValue;
    controller = TextEditingController(text: initialValue);
  }

  String get initialValue {
    var hh = widget.hour.toString().padLeft(2, "0");
    var mm = widget.minute.toString().padLeft(2, "0");
    return "$hh:$mm";
  }

  String get formattedValue {
    var hh = selectedDate?.hour.toString().padLeft(2, "0");
    var mm = selectedDate?.minute.toString().padLeft(2, "0");
    return "$hh:$mm";

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child ?? Container(),
              );
            },
          );

          selectedDate = pickedTime;
          controller.text = formattedValue;
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
}
