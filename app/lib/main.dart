import 'package:app/app.dart';
import 'package:app/services/theme_notifier_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const AlQabasyApp(),
    ),
  );
}
