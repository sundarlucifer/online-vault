import 'package:flutter/material.dart';
import 'package:online_vault/screens/home_screen.dart';

class SignUpDetailsScreen extends StatelessWidget {

  void _signUp(BuildContext context){
    // TODO: Validate input, call signup from AuthService
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
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
              'SIGN UP',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
            child: TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.white70, fontSize: 30.0),
                focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
            child: TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter PIN',
                hintStyle: TextStyle(color: Colors.white70, fontSize: 30.0),
                focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
            child: TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Re-enter PIN',
                hintStyle: TextStyle(color: Colors.white70, fontSize: 30.0),
                focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Center(
            child: Text(
              'STEP : 2',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: SizedBox(
              height: 50.0,
              child: RaisedButton(
                onPressed: () => _signUp(context),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'SIGN UP',
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
