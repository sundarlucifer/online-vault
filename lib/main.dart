import 'package:flutter/material.dart';
import 'package:online_vault/screens/home_screen.dart';
import 'package:online_vault/screens/splash_screen.dart';
import 'package:online_vault/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _screen = SplashScreen();

  @override
  Widget build(BuildContext context) {
    authService.getUser().then((user) {
      if (user != null) {
        setState(() {
          _screen = HomeScreen();
        });
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Vault',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(164, 240, 158, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(46, 77, 52, 1.0),
      ),
      home: _screen,
    );
  }
}
