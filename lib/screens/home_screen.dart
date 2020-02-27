import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            letterSpacing: 1.3,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
