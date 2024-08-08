import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

// Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Light'),
//                 Consumer<ThemeNotifier>(
//                   builder: (context, themeNotifier, child) {
//                     return Switch(
//                       value: themeNotifier.isDarkTheme,
//                       onChanged: (value) {
//                         themeNotifier.toggleTheme();
//                       },
//                     );
//                   },
//                 ),
//                 Text('Dark'),
//               ],
//             ),
