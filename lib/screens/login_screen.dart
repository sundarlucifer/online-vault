import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_vault/screens/signup_details_screen.dart';
import 'package:online_vault/services/auth.dart';

class LoginScreen extends StatelessWidget {

  void _googleSignIn(BuildContext context) {
    authService.googleSignIn().then((user) {
      if (user != null) 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpDetailsScreen()),
        );
    }).catchError((error) {
      print('$error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50.0),
          CircleAvatar(
            radius: 70.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              'SIGN IN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
            child: Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: Text(
              'Choose your google',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 30.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Text(
              'account',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 30.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          GestureDetector(
            onTap: () => _googleSignIn(context),
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image(
                height: 50.0,
                image: AssetImage('assets/images/google.png'),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Center(
            child: Text(
              'STEP : 1',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
