import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String title;
  final String? hint;
  final FontWeight? fontWeight;
  final Function(String)? onChanged;
  final Function(String?)? validator;
  const TextInput(
      {super.key,
      required this.title,
      this.hint,
      this.fontWeight,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: fontWeight,
                  color: Colors.black,
                ),
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextFormField(
              validator: (value) {
                print(value);
              },
              onChanged: onChanged,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hint,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 17)),
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
