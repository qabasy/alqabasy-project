// import 'dart:ffi';

import 'package:flutter/material.dart';

// import 'package:ecommerce/routes/';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Sales Page"),
      ),
    );
  }
}
