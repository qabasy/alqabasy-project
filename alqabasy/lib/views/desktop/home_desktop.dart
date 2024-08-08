import 'package:flutter/material.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Desktop'),
      ),
      body: const Center(
        child: Text('Welcome to the desktop version!'),
      ),
    );
  }
}
