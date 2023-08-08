import 'package:flutter/material.dart';

class TextArea extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  const TextArea({
    Key? key,
    required this.label,
    this.value,
    this.hint,
  }) : super(key: key);

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      maxLength: 20,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        helperText: widget.hint,
      ),
      onChanged: (value) {},
    );
  }
}
