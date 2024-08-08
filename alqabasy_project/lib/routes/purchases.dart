// import 'dart:ffi';

// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'package:ecommerce/models/purchase.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Purchases'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Purchases Page"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PurchaseForm()),
            );
          },
          tooltip: "Add",
          enableFeedback: true,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

Future<List<Purchase>> getAllPurchases() async {
  return [
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
    Purchase(
        id: 1,
        productId: 1,
        customerId: 1,
        price: 150,
        unitId: 1,
        total: 150,
        employeeId: 1),
  ];
}

class PurchaseForm extends StatefulWidget {
  const PurchaseForm({super.key});

  @override
  _PurchaseFormState createState() => _PurchaseFormState();
}

class _PurchaseFormState extends State<PurchaseForm> {
  late Future<List<Purchase>> _purchases;

  @override
  void initState() {
    super.initState();
    _purchases = getAllPurchases(); // Your database query method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Form')),
      body: FutureBuilder<List<Purchase>>(
        future: _purchases,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Error loading data');
          } else if (!snapshot.hasData) {
            return const Text('No data available');
          } else {
            final purchases = snapshot.data!;
            return ListView.builder(
              itemCount: purchases.length,
              itemBuilder: (context, index) {
                // final purchase = purchases[index];

                return const ListTile(
                  title: Card(
                    surfaceTintColor: Colors.blueGrey,
                    borderOnForeground: true,
                    color: Colors.red,
                    margin: EdgeInsets.only(
                      // left: 10,
                      // right: 10,
                      top: 10,
                      // bottom: 50,
                    ),
                    shadowColor: Colors.red,
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("Text"),
                    ),
                    clipBehavior: Clip.hardEdge,
                    // borderOnForeground: BorderRadius(),
                  ),
                  // Display other fields similarly
                );
              },
            );
          }
        },
      ),
    );
  }
}
