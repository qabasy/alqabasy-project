import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const route = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Dashboard Page"),
    );
  }
}
