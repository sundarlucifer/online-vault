import 'package:flutter/material.dart';
import 'package:online_vault/screens/splash_screen.dart';
import 'package:online_vault/services/auth.dart';

class HomeScreen extends StatelessWidget {
  _signOut(BuildContext context) {
    authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Text('Sign out'),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
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
