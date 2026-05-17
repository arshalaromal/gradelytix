import 'package:flutter/material.dart';
import 'package:gradelytix/examtype.dart';
import 'package:gradelytix/globals.dart';

class CatChooser extends StatefulWidget {
  Function refresh;
  CatChooser(this.refresh, {super.key});

  @override
  State<CatChooser> createState() => _CatChooserState();
}

class _CatChooserState extends State<CatChooser> {
  List<String> c = [];

  String currentValue = '';
  String? selectedValue;
  _CatChooserState() {
    cats.forEach((element) => c.add(element.type));

    c.insert(0, "Select Category");
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: DropdownMenu<String>(
              label: const Text("Select Category"),
              width: null,
              initialSelection: selectedValue,
              onSelected: (String? value) {
                setState(() {
                  currentValue = value!;
                  if (currentValue != "Select Category") {
                    cat = currentValue;
                    disabled = false;
                    widget.refresh();
                  } else {
                    disabled = true;
                    widget.refresh();
                  }
                });
              },
              dropdownMenuEntries:
                  c.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController tc = TextEditingController();
                      return AlertDialog(
                        title: const Text("Add Category"),
                        content: TextField(
                          controller: tc,
                          autofocus: true,
                          decoration: const InputDecoration(
                              hintText: "Enter Category Name"),
                        ),
                        actions: [
                          TextButton.icon(
                              onPressed: () {
                                widget.refresh();
                                c.add(tc.text);
                                cats.add(ExamType(type: tc.text));
                                cat = tc.text;
                                currentValue = cat;
                                disabled = false;
                                selectedValue = tc.text;
                                Navigator.of(context).pop();
                                setState(() {
                                  currentValue = tc.text;
                                  selectedValue = tc.text;
                                  widget.refresh();
                                });
                                widget.refresh();
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add Category"))
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}
