import 'package:alqabasy_project/routes/dashboard.dart';
import 'package:alqabasy_project/routes/purchases.dart';
import 'package:alqabasy_project/routes/sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:sizer/sizer.dart';

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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      drawer: SideMenu(
        position: SideMenuPosition.left,
        mode: SideMenuMode.open,
        hasResizer: true,
        hasResizerToggle: false,
        priority: SideMenuPriority.mode,
        resizerData: const ResizerData(
          resizerWidth: 2,
        ),
        builder: (data) => SideMenuData(
          header: Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 0.h, right: 1.w, left: 1.w),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/person.light.jpg"),
                ),
                SizedBox(height: 10),
                Text(
                  "Person Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          items: [
            SideMenuItemDataDivider(
              divider: Divider(
                indent: 5.w * 2,
                thickness: 2,
                color: Colors.blueGrey,
                endIndent: 5.5.w * 2,
              ),
            ),
            SideMenuItemDataTile(
              isSelected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
              title: 'Dashboard',
              icon: const Icon(Icons.dashboard),
              tooltip: "Open Dashboard",
            ),
            SideMenuItemDataTile(
              isSelected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
              title: 'Purchases',
              icon: const Icon(Icons.access_time),
              tooltip: "Open Purchases",
            ),
            SideMenuItemDataTile(
              isSelected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
              title: 'Sales',
              tooltip: "Open Sales",
              icon: const Icon(Icons.local_shipping_sharp),
            ),
          ],
          footer: Padding(
            padding: const EdgeInsetsDirectional.all(10),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
                icon: const Icon(Icons.logout),
                label: const Text("Sign Out"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
