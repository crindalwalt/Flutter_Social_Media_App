import 'package:flutter/material.dart';


class ExplorePage extends StatelessWidget {
  final List<User> _users = [
    User('User1', 'Hello, this is a random post!', 'assets/user.png'),
    User('User2', 'Just chilling!', 'assets/user.png'),
    User('User3', 'Check out my new photo!', 'assets/user.png'),
    User('User4', 'Loving this weather!', 'assets/user.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
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
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return _buildUserCard(_users[index]);
          },
        ),
      ),
    );
  }

  Widget _buildUserCard(User user) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.userImage),
            ),
            title: Text(
              user.userName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(Icons.person_add, color: Colors.blue),
              onPressed: () {
                // Handle add friend action
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(user.postContent),
          ),
          Image.asset('assets/post_image.png'), // Add a random post image
        ],
      ),
    );
  }
}

class User {
  final String userName;
  final String postContent;
  final String userImage;

  User(this.userName, this.postContent, this.userImage);
}
