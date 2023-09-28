import 'package:flutter/material.dart';
import 'package:flutter_application_test1/Screens/login_screen.dart';
import 'package:flutter_application_test1/Screens/signup_screen.dart';
import 'first_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildWelcomeText(),
            SizedBox(height: 20.0),
            _buildButton('Login', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
            SizedBox(height: 10.0),
            _buildButton('Signup', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            }),
            SizedBox(height: 10.0),
            _buildTextButton('Skip', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FirstScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      'Welcome to L.earn',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      child: Text(label),
      onPressed: onPressed,
    );
  }

  Widget _buildTextButton(String label, VoidCallback onPressed) {
    return TextButton(
      child: Text(label),
      onPressed: onPressed,
    );
  }
}
