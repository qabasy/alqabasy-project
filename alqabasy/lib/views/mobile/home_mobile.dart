import 'package:flutter/material.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Mobile'),
      ),
      body: Center(
        child: Text('Welcome to the mobile version!'),
      ),
    );
  }
}
