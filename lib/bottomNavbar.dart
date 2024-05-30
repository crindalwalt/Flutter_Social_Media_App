import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material 3 BottomNavbar',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: BottomNavbar(),
    );
  }
}


class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Notifications Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      destinations: [
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.bell),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.user),
          label: 'Profile',
        ),
      ],
    );
  }
}
