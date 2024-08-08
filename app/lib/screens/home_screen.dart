import 'package:app/screens/dashboard_screen.dart';
import 'package:app/screens/purchases_screen.dart';
import 'package:app/screens/sales_screen.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:app/services/theme_notifier_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _selectedScreen = DashboardScreen();

  void _navigateToScreen(Widget screen) {
    setState(() {
      _selectedScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 25,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          children: [
            SideMenu(
              hasResizer: true,
              hasResizerToggle: true,
              maxWidth: 200,
              builder: (data) => SideMenuData(
                header: Padding(
                  padding: const EdgeInsets.all(0),
                  child: (data.isOpen
                      ? Text(
                          "Welcome, Mahros.",
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      : IconButton(onPressed: () {}, icon: Icon(Icons.person))),
                ),
                items: [
                  SideMenuItemDataDivider(
                    divider: Divider(
                      height: 2.h,
                      color: Colors.transparent,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _selectedScreen is DashboardScreen,
                    onTap: () => _navigateToScreen(DashboardScreen()),
                    title: 'Dashboard',
                    // tooltip: "Open Dashboard",

                    icon: const Icon(Icons.dashboard_rounded),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _selectedScreen is PurchasesScreen,
                    onTap: () => _navigateToScreen(PurchasesScreen()),
                    title: 'Purchases',
                    // tooltip: "Open Purchases",
                    icon: const Icon(Icons.account_balance_wallet_rounded),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _selectedScreen is SalesScreen,
                    onTap: () => _navigateToScreen(SalesScreen()),
                    title: 'Sales',
                    // tooltip: "Open Sales",
                    icon: const Icon(Icons.point_of_sale),
                  ),
                ],
                footer: Padding(
                  padding: EdgeInsets.only(bottom: 1.05.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Consumer<ThemeNotifier>(
                      builder: (context, themeNotifier, child) {
                        return TextButton(
                            onPressed: () {
                              _navigateToScreen(SettingsScreen());
                            },
                            child: Row(
                              children: [
                                Icon(Icons.settings),
                                Padding(
                                  padding: EdgeInsets.all((data.isOpen ? 8 : 0)),
                                  child: Text(
                                    (data.isOpen ? "Settings" : ""),
                                    style: TextStyle(
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: _selectedScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
