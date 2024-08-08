import 'package:alqabasy/views/all/dashboard.dart';
import 'package:alqabasy/views/all/purchases.dart';
import 'package:alqabasy/views/all/sales.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const PurchasesScreen(),
    const SalesScreen(),

    // Add more pages here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AL-Qabasy Project'),
        shadowColor: Colors.black,
        elevation: 5,
        primary: true,
      ),
    );
  }
}
