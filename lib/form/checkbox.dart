import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String id;
  final String label;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item) validator;
  final ValueChanged<List<Map<String, dynamic>>>?
      onChanged; // Updated onChanged callback

  const CheckBox({
    Key? key,
    required this.id,
    required this.label,
    required this.items,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      items.add(Map.from(item));
    }
  }

  void updateCheckboxValue(int index, bool value) {
    setState(() {
      items[index]['checked'] = value;
    });
    // Call the onChanged callback if provided
    if (widget.onChanged != null) {
      widget.onChanged!(items); // Provide updated items list
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) => widget.validator(items),
      builder: (FormFieldState<bool> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return CheckboxListTile(
                  title: Text(item['label']),
                  value: item['checked'] ?? false,
                  onChanged: (value) {
                    // Use Future.microtask to schedule the update
                    Future.microtask(() {
                      updateCheckboxValue(index, value!);
                      field.didChange(
                          items.any((item) => item['checked'] ?? false));
                    });
                  },
                );
              }).toList(),
            ),
            field.errorText != null
                ? Text(
                    field.errorText!,
                    style: TextStyle(color: Colors.red),
                  )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
