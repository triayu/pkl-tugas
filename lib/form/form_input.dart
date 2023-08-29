import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String title;
  final String? hint;
  final FontWeight? fontWeight;
  final Function(String)? onChanged;
  final Function(String?)? validator;
  const FormInput(
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
                  fontSize: 20,
                  fontWeight: fontWeight,
                  color: Colors.black,
                ),
              )
            : Container(),
        Container()
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class FormDatepicker extends StatefulWidget {
//   const FormDatepicker({super.key});

//   @override
//   State<FormDatepicker> createState() => _FormDatepickerState();
// }

// class _FormDatepickerState extends State<FormDatepicker> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       initialValue: 'email@gmail.com',
//       maxLength: 20,
//       decoration: const InputDecoration(
//         labelText: 'Email',
//         labelStyle: TextStyle(
//           color: Colors.amber,
//         ),
//         suffixIcon: Icon(
//           Icons.email,
//         ),
//         enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//           color: Colors.blueAccent,
//         )),
//         helperText: 'Enter Your Email Address',
//       ),
//       onChanged: (value) {},
//     );
//   }
// }
