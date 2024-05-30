import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/widgets/bottom_navbar.dart';
import 'package:new_app/widgets/top_navbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const homeIcon = Icon(Icons.home);
    const exploreIcon = Icon(Icons.explore);
    const notificationIcon = Icon(Icons.notifications);
    const profileIcon = Icon(Icons.person);

    final labels = ['Home', 'Explore', 'Notifications', 'Profile'];
    return Scaffold(
      appBar: Material3AppBar(
        title: 'Social Media App',
        leading: const Icon(Icons.app_registration), // Example leading widget
        onChatPressed: () => print('Chat button pressed'),
        onSearchPressed: () => print('Search button pressed'),
      ),
      bottomNavigationBar: Material3BottomNavigationBar(
        currentIndex: 0, // Initial selected index
        icons: [homeIcon, exploreIcon, notificationIcon, profileIcon],
        labels: labels,
        onItemSelected: (index) {
          print("$index is selected");
        }, // Example handler
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildPostCard(context);
          },
        ),
      ),
    );
  }

  Widget _buildPostCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), // Add a user avatar image
                ),
                SizedBox(width: 10),
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'This is a sample post content. It can be a text, an image, or a combination of both. This section represents the content of a user\'s post on the social media app.',
            ),
            SizedBox(height: 10),
            Image.network(
                "https://source.unsplash.com/random/400x400"), // Add a post image
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(
                  icon: FontAwesomeIcons.thumbsUp,
                  text: 'Like',
                  onPressed: () {
                    // Handle like action
                  },
                ),
                _buildIconButton(
                  icon: FontAwesomeIcons.comment,
                  text: 'Comment',
                  onPressed: () {
                    // Handle comment action
                  },
                ),
                _buildIconButton(
                  icon: FontAwesomeIcons.share,
                  text: 'Share',
                  onPressed: () {
                    // Handle share action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      icon: FaIcon(icon),
      label: Text(text),
      onPressed: onPressed,
    );
  }
}
