// lib/views/my_data_table.dart
import 'package:flutter/material.dart';

import '../models/all.dart';

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  String filter = '';
  List<Employee> data = generateSampleData();

  @override
  Widget build(BuildContext context) {
    List<Employee> filteredData = data.where((person) {
      return filter.isEmpty || person.name!.contains(filter);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(labelText: 'Filter by Name'),
            onChanged: (value) {
              setState(() {
                filter = value;
              });
            },
          ),
        ),
        Expanded(
          child: Text("Home"),
        ),
      ],
    );
  }
}

List<Employee> generateSampleData() {
  return List<Employee>.generate(
    100,
    (index) => Employee(
      name: 'Name $index',
      id: 20 + index % 30,
      position: 'Pos#$index',
    ),
  );
}
