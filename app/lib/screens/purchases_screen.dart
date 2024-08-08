import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PurchasesScreen extends StatefulWidget {
  @override
  _PurchasesScreenState createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  final List<Map<String, dynamic>> purchases = generateTestData(10);

  static List<Map<String, dynamic>> generateTestData(int count) {
    final List<Map<String, dynamic>> testData = [];
    final Random random = Random();

    for (int i = 0; i < count; i++) {
      final int subRowCount = random.nextInt(5) + 1;
      final List<Map<String, dynamic>> subRows = List.generate(subRowCount, (index) {
        return {
          'ID': '${i + 1}.${index + 1}',
          'CustomerName': 'Customer ${index + 1}',
          'Amount': random.nextInt(100) + 1,
          'Price': (random.nextDouble() * 100).toStringAsFixed(2),
          'Discount': (random.nextDouble() * 10).toStringAsFixed(2),
          'TotalMoney': (random.nextDouble() * 1000).toStringAsFixed(2),
        };
      });

      testData.add({
        'ID': '${i + 1}',
        'CarNumber': 'CAR${random.nextInt(1000)}',
        'TotalAmount': random.nextInt(100) + 1,
        'TotalMoney': (random.nextDouble() * 1000).toStringAsFixed(2),
        'PriceAverage': (random.nextDouble() * 100).toStringAsFixed(2),
        'TotalDiscount': (random.nextDouble() * 50).toStringAsFixed(2),
        'Date': '2024-08-${random.nextInt(30) + 1}',
        'subRows': subRows,
      });
    }

    return testData;
  }

  void _addNewPurchase() async {
    final newPurchase = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return NewPurchaseDialog();
      },
    );

    if (newPurchase != null) {
      setState(() {
        purchases.add(newPurchase);
      });
    }
  }

  void _addNewSubRow(int purchaseIndex) async {
    final newSubRow = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return NewSubRowDialog();
      },
    );

    if (newSubRow != null) {
      setState(() {
        purchases[purchaseIndex]['subRows'].add(newSubRow);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: Text(
          "Purchases",
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewPurchase,
        child: Icon(Icons.add),
        tooltip: "Add Purchase",
      ),
      body: ListView(
        children: [
          _buildMainRowsTable(),
          ...purchases.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> purchase = entry.value;
            return _buildPurchaseTile(purchase, index);
          }).toList()
        ],
      ),
    );
  }

  Widget _buildPurchaseTile(Map<String, dynamic> purchase, int index) {
    return ExpansionTile(
      title: _buildPurchaseTitle(purchase),
      children: [
        _buildSubRowsTable(purchase['subRows']),
        ElevatedButton(
          onPressed: () => _addNewSubRow(index),
          child: Text('Add Sub Row'),
        ),
      ],
    );
  }

  Widget _buildPurchaseTitle(Map<String, dynamic> purchase) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text(purchase['ID'])),
        Expanded(child: Text(purchase['CarNumber'])),
        Expanded(child: Text(purchase['TotalAmount'].toString())),
        Expanded(child: Text(purchase['TotalMoney'].toString())),
        Expanded(child: Text(purchase['PriceAverage'].toString())),
        Expanded(child: Text(purchase['TotalDiscount'].toString())),
        Expanded(child: Text(purchase['Date'])),
      ],
    );
  }

  Widget _buildSubRowsTable(List<Map<String, dynamic>> subRows) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('CustomerName')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Discount')),
        DataColumn(label: Text('TotalMoney')),
      ],
      rows: subRows.map<DataRow>((subRow) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(subRow['ID'])),
            DataCell(Text(subRow['CustomerName'])),
            DataCell(Text(subRow['Amount'].toString())),
            DataCell(Text(subRow['Price'].toString())),
            DataCell(Text(subRow['Discount'].toString())),
            DataCell(Text(subRow['TotalMoney'].toString())),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMainRowsTable() {
    return DataTable(
      showBottomBorder: true,
      showCheckboxColumn: true,
      columns: const <DataColumn>[
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('CarNumber')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Discount')),
        DataColumn(label: Text('TotalMoney')),
        DataColumn(label: Text('TotalMoney')),
      ],
      rows: [],
    );
  }
}

class NewPurchaseDialog extends StatefulWidget {
  @override
  _NewPurchaseDialogState createState() => _NewPurchaseDialogState();
}

class _NewPurchaseDialogState extends State<NewPurchaseDialog> {
  final _formKey = GlobalKey<FormState>();
  final _carNumberController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Purchase Container'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _carNumberController,
                decoration: InputDecoration(labelText: 'Car Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a car number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newPurchase = <String, dynamic>{
                'ID': '${Random().nextInt(1000)}',
                'CarNumber': _carNumberController.text,
                'TotalAmount': "0",
                'TotalMoney': "0",
                'TotalDiscount': "0",
                'Date': _dateController.text,
                'subRows': <Map<String, dynamic>>[],
              };
              Navigator.of(context).pop(newPurchase);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class NewSubRowDialog extends StatefulWidget {
  @override
  _NewSubRowDialogState createState() => _NewSubRowDialogState();
}

class _NewSubRowDialogState extends State<NewSubRowDialog> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _amountController = TextEditingController();
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();
  final _totalMoneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Sub Purchase'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _customerNameController,
                decoration: InputDecoration(labelText: 'Customer Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a customer name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _discountController,
                decoration: InputDecoration(labelText: 'Discount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a discount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _totalMoneyController,
                decoration: InputDecoration(labelText: 'Total Money'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total money';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newSubRow = {
                'ID': '${Random().nextInt(1000)}',
                'CustomerName': _customerNameController.text,
                'Amount': int.parse(_amountController.text),
                'Price': _priceController.text,
                'Discount': _discountController.text,
                'TotalMoney': _totalMoneyController.text,
              };
              Navigator.of(context).pop(newSubRow);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
