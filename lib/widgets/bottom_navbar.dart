import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/screen/explore_screen.dart';
import 'package:new_app/screen/home_screen.dart';
import 'package:new_app/screen/notification_screen.dart';
import 'package:new_app/screen/profile_screen.dart';

// class BottomNavbar extends StatefulWidget {
//   @override
//   _BottomNavbarState createState() => _BottomNavbarState();
// }

// class _BottomNavbarState extends State<BottomNavbar> {
//   int _selectedIndex = 0;
//   static List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     ExplorePage(),
//     NotificationPage(),
//     ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//       selectedIndex: _selectedIndex,
//       onDestinationSelected: _onItemTapped,
//       destinations: const [
//         NavigationDestination(
//           icon: FaIcon(FontAwesomeIcons.home),
//           label: 'Home',
//         ),
//         NavigationDestination(
//           icon: FaIcon(FontAwesomeIcons.search),
//           label: 'Search',

//         ),
//         NavigationDestination(
//           icon: FaIcon(FontAwesomeIcons.bell),
//           label: 'Notifications',
//         ),
//         NavigationDestination(
//           icon: FaIcon(FontAwesomeIcons.user),
//           label: 'Profile',

//         ),
//       ],
//     );
//   }
// }

class Material3BottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<Widget> icons;
  final List<String> labels;
  final ValueChanged<int> onItemSelected;

  const Material3BottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.icons,
    required this.labels,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // Ensure correct number of items based on provided lists
      destinations: List.generate(
        icons.length,
        (index) => NavigationDestination(
          icon: icons[index],
          label: labels[index],
        ),
      ),
      selectedIndex: currentIndex,
      onDestinationSelected: onItemSelected,
      // Use filled icons and contrasting indicator for Material 3 style
      labelBehavior:
          NavigationDestinationLabelBehavior.alwaysHide, // Hide labels
      elevation: 4.0, // Adjust elevation as desired
    );
  }
}
