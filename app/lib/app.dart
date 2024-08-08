import 'package:app/screens/home_screen.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/services/theme_notifier_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AlQabasyApp extends StatelessWidget {
  const AlQabasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'AL-Qabasy Project - Platform.${deviceType.name.toLowerCase()}',
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,

        // Theme
        themeMode: themeNotifier.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        themeAnimationDuration: Duration.zero,
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: Typography().white.apply(fontFamily: 'Cairo'),
          colorScheme: ColorScheme.highContrastDark(),
        ),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Cairo",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        ),

        // Routes
        initialRoute: '/',
        routes: {
          '/': (context) => const SignInScreen(),
          '/home': (context) => const HomeScreen(),
        },
      );
    });
  }
}
