import 'package:app/screens/purchases_screen.dart';
import 'package:app/screens/sales_screen.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'client_screen.dart';
import 'driver_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 5,
          children: [
            _buildManagementTile(
              context,
              icon: Icons.person,
              title: 'Client Management',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClientScreen(),
                ));
              },
            ),
            _buildManagementTile(
              context,
              icon: Icons.local_shipping,
              title: 'Driver Management',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DriverScreen(),
                ));
              },
            ),
            _buildManagementTile(
              context,
              icon: Icons.shopping_cart,
              title: 'Purchases Management',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PurchasesScreen(),
                ));
              },
            ),
            _buildManagementTile(
              context,
              icon: Icons.point_of_sale,
              title: 'Sales Management',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SalesScreen(),
                ));
              },
            ),
            _buildManagementTile(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50),
              SizedBox(height: 10.sp),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
