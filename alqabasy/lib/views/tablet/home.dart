import 'package:flutter/material.dart';

class HomeTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Tablet'),
      ),
      body: Center(
        child: Text('Welcome to the tablet version!'),
      ),
    );
  }
}
