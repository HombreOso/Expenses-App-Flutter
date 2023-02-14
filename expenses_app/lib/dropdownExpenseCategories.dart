import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {

  final Function(String) onChangedDDL;

  DropdownButtonExample({
    super.key,
    required this.onChangedDDL,
  });

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState(onChangedDDL: onChangedDDL);
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  final List<String> listExpenseCategories = const <String>["Food", "Amazon", "Education", "Gadgets", "Others"];
  Function(String) onChangedDDL;
  String dropdownValue = "Food";

  _DropdownButtonExampleState(
    {
        required this.onChangedDDL,
    }
  );

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;

        });
        onChangedDDL(dropdownValue);
      },
      items: listExpenseCategories.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}