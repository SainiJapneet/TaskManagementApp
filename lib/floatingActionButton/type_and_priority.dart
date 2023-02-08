import 'package:flutter/material.dart';

class TypeAndPriority extends StatefulWidget {
  const TypeAndPriority({super.key});

  @override
  State<TypeAndPriority> createState() => _TypeAndPriorityState();
}

class _TypeAndPriorityState extends State<TypeAndPriority> {
  String typeValue = "Work";
  List<String> typeList = ['Work', 'Personal', 'Miscellaneous'];
  String priorityValue = "Urgent";
  List<String> priorityList = ['Urgent', 'Fast', 'Cool'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dropDown(typeValue, typeList, "Type"),
        dropDown(priorityValue, priorityList, "Priority")
      ],
    );
  }

  dropDown(String dropDownValue, List<String> dropDownList, String dropDown) {
    return Container(
      margin:
          const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 18, right: 22.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropDownValue,
          dropdownColor: Colors.yellow,
          iconDisabledColor: Colors.purple,
          focusColor: Colors.yellow,
          iconEnabledColor: Colors.purple,
          items: dropDownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: const TextStyle(fontSize: 18, color: Colors.purple)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              if (dropDown == "Type") {
                typeValue = newValue!;
              }
              if (dropDown == "Priority") {
                priorityValue = newValue!;
              }
            });
          },
        ),
      ),
    );
  }
}
