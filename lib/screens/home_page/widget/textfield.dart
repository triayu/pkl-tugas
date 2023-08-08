import 'package:flutter/material.dart';

class TextfieldView extends StatefulWidget {
  final String id;
  final String label;
  final String? value;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const TextfieldView({
    Key? key,
    required this.id,
    required this.label,
    this.value,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextfieldView> createState() => _TextfieldViewState();
}

class _TextfieldViewState extends State<TextfieldView> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'John Doe',
      maxLength: 20,
      decoration: const InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        helperText: "What's your name?",
      ),
      onChanged: (value) {},
    );
  }
}
