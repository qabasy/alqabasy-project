import 'package:alqabasy_project/routes/dashboard.dart';
import 'package:alqabasy_project/routes/home.dart';
import 'package:alqabasy_project/routes/signin.dart';
import 'package:alqabasy_project/routes/signup.dart';
import 'package:flutter/material.dart';

class ScreenRoutes {
  /// home route
  // static const loading = LoadingScreen.route;
  static const signin = SignInScreen.route;
  static const signup = SignupPage.route;
  static const home = HomeScreen.route;
  static const dashboard = DashboardScreen.route;
}

Map<String, Widget Function(BuildContext)> screenRoutes = {
  // ScreenRoutes.loading: (context) => const LoadingScreen(),
  ScreenRoutes.signin: (context) => const SignInScreen(),
  ScreenRoutes.signup: (context) => SignupPage(),
};
