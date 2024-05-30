import 'package:flutter/material.dart';
import 'package:new_app/screen/home_screen.dart';
import 'package:new_app/screen/profile_screen.dart';
import 'package:new_app/screen/single_thread.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
