import 'package:alqabasy/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  try {
    runApp(const App());
  } catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }
}
