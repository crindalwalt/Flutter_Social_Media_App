import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                _buildLoginButton(
                  icon: FontAwesomeIcons.google,
                  text: 'Continue with Google',
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    // Handle Google login
                  },
                ),
                SizedBox(height: 20),
                _buildLoginButton(
                  icon: FontAwesomeIcons.github,
                  text: 'Continue with GitHub',
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    // Handle GitHub login
                  },
                ),
                SizedBox(height: 40),
                Text(
                  'or',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 40),
                _buildEmailPasswordLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton({
    required IconData icon,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: FaIcon(icon, color: textColor),
      label: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildEmailPasswordLoginForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Email',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle Email/Password login
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text('Login', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
