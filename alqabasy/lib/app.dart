import 'package:alqabasy/pages/home.dart';
import 'package:alqabasy/views/all/signin.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'E-Commerce App - ${deviceType.name}',
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,

        // Theme
        themeMode: ThemeMode.system,
        themeAnimationDuration: Duration.zero,
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: Typography().white.apply(fontFamily: 'Cairo'),
        ),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Cairo",
        ),

        // Routes
        initialRoute: '/',
        routes: {
          '/': (context) => const SignInView(),
          '/home': (context) => const HomeView(),
          // '/sales': (context) => const SalesScreen(),
          // '/purchases': (context) => const PurchasesScreen(),
        },
      );
    });
  }
}
