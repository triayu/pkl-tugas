import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownPicker<T> extends StatefulWidget {
  final String label;
  final T? value;
  final List<T> options;
  final ValueChanged<T?> onChanged;

  DropdownPicker({
    Key? key,
    required this.label,
    this.value,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropdownPicker<T>> createState() => _DropdownPickerState<T>();
}

class _DropdownPickerState<T> extends State<DropdownPicker<T>> {
  late TextEditingController controller;
  T? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.value ?? widget.options[0];
    controller = TextEditingController(text: selectedOption.toString());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 250,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedOption = widget.options[index];
                        controller.text = selectedOption.toString();
                      });
                    },
                    children: widget.options.map((option) {
                      return Center(
                        child: Text(
                          option.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context, selectedOption);
                      widget.onChanged(selectedOption);
                    },
                    child: Text('Select'),
                  ),
                ],
              ),
            );
          },
        );
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
            Icons.arrow_drop_down,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
