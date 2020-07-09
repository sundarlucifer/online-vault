import 'package:flutter/material.dart';
import 'package:online_vault/screens/splash_screen.dart';
import 'package:online_vault/services/auth.dart';
import 'package:online_vault/services/password.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _passwordService = PasswordService();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  _signOut(BuildContext context) {
    authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  _encrypt(BuildContext context) {
    _passwordService.encryptAndAdd(
        _titleController.value.text, _passwordController.value.text);
    _titleController.clear();
    _passwordController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passwords'),
        actions: <Widget>[
          FlatButton(
            child: Text('Sign out'),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      floatingActionButton: _getAddButton(context),
      body: ListView.builder(
        itemCount: _passwordService.passwords.length,
        itemBuilder: (context, index) => _buildPassword(index),
      ),
    );
  }

  _buildPassword(int index) {
    Password password = _passwordService.passwords[index];
    return Container(
      color: Colors.green.withOpacity(0.3),
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Text(
            password.title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.lightGreenAccent,
            ),
            onPressed: () => _viewPasswordDilog(context, index),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => _passwordService.passwords.remove(password),
          ),
        ],
      ),
    );
  }

  _viewPasswordDilog(BuildContext context, int index) {
    final Password password = _passwordService.passwords[index];
    String decryptedPass;
    final keyController = TextEditingController();
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(password.title +
            ': ' +
            (decryptedPass ?? password.encryptedPassword)),
        content: TextField(controller: keyController),
        actions: <Widget>[
          FlatButton(
            child: Text('Decrypt'),
            onPressed: () {
              setState(() {
                decryptedPass =
                    _passwordService.decrypt(password.encryptedPassword, keyController.value.text);
              });
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  _addPassword(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Title'),
        ),
        content: TextField(
          controller: _passwordController,
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Encrypt'),
            onPressed: () => _encrypt(context),
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _getAddButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Theme.of(context).accentColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => _addPassword(context),
    );
  }
}
