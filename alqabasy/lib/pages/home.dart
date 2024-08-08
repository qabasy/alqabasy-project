import 'package:alqabasy/views/all/dashboard.dart';
import 'package:alqabasy/views/all/purchases.dart';
import 'package:alqabasy/views/all/sales.dart';
import 'package:flutter/material.dart';
import 'package:material3_layout/material3_layout.dart';

// HomePage
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return NavigationScaffold(
      onDestinationSelected: (x) {
        print(x.toString() + " ------------");
      },
      navigationSettings: RailAndBottomSettings(
        // showMenuIcon: true,
        addThemeSwitcherTrailingIcon: true,
        // trailing: Icon(Icons.near_me),
        // leading: Icon(Icons.near_me),
        pages: <Widget>[PurchasesScreen(), SalesScreen(), DashboardScreen()],
        destinations: [
          DestinationModel(
            label: 'Home',
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_filled),
            tooltip: 'Home page',
          ),
          DestinationModel(
            label: 'Users',
            icon: const Icon(Icons.group_outlined),
            selectedIcon: const Icon(Icons.group),
            tooltip: 'Users page',
          ),
          DestinationModel(
            label: 'Messages',
            badge: Badge.count(
              count: 125,
              child: const Icon(Icons.message_outlined),
            ),
            selectedIcon: const Icon(Icons.message),
            tooltip: 'Messages',
          ),
        ],
        // leading: const CircleAvatar(
        //   child: Icon(Icons.person),
        // ),
        // trailing: const Icon(Icons.exit_to_app),
        // showMenuIcon: true,
        groupAlignment: -1.0,
        // trailing: Text("TRAI"),
        labelType: NavigationRailLabelType.all,
      ),
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: "Cairo",
      ),
    );
  }
}
