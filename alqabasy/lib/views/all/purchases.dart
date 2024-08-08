import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  _PurchasesScreenState createState() => _PurchasesScreenState();
}

// List<ExpandableColumn<dynamic>> headers = [
//   ExpandableColumn<int>(columnTitle: "ID", columnFlex: 1),
//   ExpandableColumn<String>(columnTitle: "First name", columnFlex: 2),
//   ExpandableColumn<String>(columnTitle: "Last name", columnFlex: 2),
//   ExpandableColumn<String>(columnTitle: "Maiden name", columnFlex: 2),
//   ExpandableColumn<int>(columnTitle: "Age", columnFlex: 1),
//   ExpandableColumn<String>(columnTitle: "Gender", columnFlex: 2),
//   ExpandableColumn<String>(columnTitle: "Email", columnFlex: 4),
// ];
// List<ExpandableRow> rows = userList.map<ExpandableRow>((e) {
//   return ExpandableRow(cells: [
//     ExpandableCell<int>(columnTitle: "ID", value: e.id),
//     ExpandableCell<String>(columnTitle: "First name", value: e.firstName),
//     ExpandableCell<String>(columnTitle: "Last name", value: e.lastName),
//     ExpandableCell<String>(columnTitle: "Maiden name", value: e.maidenName),
//     ExpandableCell<int>(columnTitle: "Age", value: e.age),
//     ExpandableCell<String>(columnTitle: "Gender", value: e.gender),
//     ExpandableCell<String>(columnTitle: "Email", value: e.email),
//   ]);
// }).toList();
class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExpandableTheme(
          data: ExpandableThemeData(
            context,
            // rowBorder: const BorderSide(color: Colors.amber),
            // expandedBorderColor: Colors.transparent,
            paginationSize: 48,
          ),
          child: ExpandableDataTable(
            rows: [
              ExpandableRow(cells: [
                ExpandableCell(
                  columnTitle: "ID",
                  value: 10,
                ),
                ExpandableCell(
                  columnTitle: "Car Serial",
                  value: "1389 - ABC",
                ),
              ]),
              ExpandableRow(
                cells: [
                  ExpandableCell(
                    columnTitle: "ID",
                    value: 10,
                  ),
                  ExpandableCell(
                    columnTitle: "Car Serial",
                    value: "1389 - ABC",
                  ),
                ],
              ),
            ],
            headers: [
              ExpandableColumn<int>(
                columnTitle: "ID",
                columnFlex: 1,
              ),
              ExpandableColumn<String>(
                columnTitle: "Car Serial",
                columnFlex: 2,
              ),
              // ExpandableColumn<String>(
              //   columnTitle: "Last name",
              //   columnFlex: 2,
              // ),
              // ExpandableColumn<String>(
              //   columnTitle: "Maiden name",
              //   columnFlex: 2,
              // ),
            ],
            visibleColumnCount: 2,
            isEditable: false,
            // multipleExpansion: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
// void _showAddPurchaseDialog() {
//   final _formKey = GlobalKey<FormState>();
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Add Purchase', style: TextStyle(fontSize: 12.sp)),
//         content: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                     labelText: 'Customer Name',
//                     labelStyle: TextStyle(fontSize: 10.sp)),
//                 items: _customers.map((String customer) {
//                   return DropdownMenuItem<String>(
//                     value: customer,
//                     child: Text(customer, style: TextStyle(fontSize: 10.sp)),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedCustomer = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a customer';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 2.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Amount (KG)',
//                     labelStyle: TextStyle(fontSize: 10.sp)),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     _amount = double.tryParse(value) ?? 0.0;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter amount';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 2.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Price',
//                     labelStyle: TextStyle(fontSize: 10.sp)),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     _price = double.tryParse(value) ?? 0.0;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter price';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 2.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Car ID',
//                     labelStyle: TextStyle(fontSize: 10.sp)),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     _carID = int.tryParse(value) ?? 0;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter car ID';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 2.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Discount',
//                     labelStyle: TextStyle(fontSize: 10.sp)),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     _discount = double.tryParse(value) ?? 0.0;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter discount';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 2.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Discount Description',
//                     labelStyle: TextStyle(fontSize: 10.sp)),
//                 onChanged: (value) {
//                   setState(() {
//                     _discountDescription = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 2.h),
//               Text(
//                 'Total Money: \$${_totalMoney.toStringAsFixed(2)}',
//                 style:
//                     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Cancel', style: TextStyle(fontSize: 10.sp)),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ElevatedButton(
//             child: Text('Submit', style: TextStyle(fontSize: 10.sp)),
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 setState(() {
//                   _purchases.add({
//                     'customerName': _selectedCustomer,
//                     'amount': _amount,
//                     'price': _price,
//                     'carID': _carID,
//                     'discount': _discount,
//                     'discountDescription': _discountDescription,
//                     'totalMoney': _totalMoney,
//                   });
//                 });
//                 Navigator.of(context).pop();
//               }
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
