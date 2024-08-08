import 'package:alqabasy_project/models/database.dart';
import 'package:alqabasy_project/routes/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  final DatabaseService _databaseService = DatabaseService();

  @override
  void dispose() {
    _databaseService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: MaterialApp(
            showPerformanceOverlay: false,
            debugShowCheckedModeBanner: false,

            title: 'E-Commerce App',
            themeMode: ThemeMode.system,
            themeAnimationDuration: Duration.zero,
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              textTheme: Typography().white.apply(fontFamily: 'Cairo'),
            ),

            // color: Colors.red,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: "Cairo",
              // primaryColor: Colors.lightGreenAccent,
              // primarySwatch: Colors.blue,
              // colorScheme: ColorScheme.fromSwatch(
              //   primarySwatch: Colors.lightBlue,
              // ),
            ),
            // initialRoute: '/',
            initialRoute: ScreenRoutes.signin,
            // routes: {
            //   '/': (context) => const SignInScreen(),
            //   '/home': (context) => const HomeScreen(),
            //   '/sales': (context) => const SalesScreen(),
            //   '/purchases': (context) => const PurchasesScreen(),
            // },
            routes: screenRoutes,
            navigatorKey: navigatorKey,
            // onGenerateRoute: router.generateRoute,
          ),
        );
      },
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  // bool get isNotNull {
  //   return this != null;
  // }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
