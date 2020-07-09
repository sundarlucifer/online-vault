import 'package:flutter/material.dart';
import 'package:online_vault/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
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
              'A new freedom of',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Text(
              'SECURITY',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: Text(
              'Join us to SECURE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              'your passwords',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 70.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: 50.0,
              child: RaisedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'Start your journey',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
