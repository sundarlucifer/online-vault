import 'package:flutter/material.dart';
import 'package:online_vault/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Vault',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(164, 240, 158, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(46, 77, 52, 1.0),
      ),
      home: SplashScreen(),
    );
  }
}