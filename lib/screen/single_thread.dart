import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thread'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            _buildThreadCard(context),
            SizedBox(height: 20),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ..._buildCommentsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThreadCard(BuildContext context) {
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
                  backgroundImage: AssetImage('assets/user.png'), // Add a user avatar image
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
              'This is the main thread content. It can be a text, an image, or a combination of both. This section represents the content of the original post on the social media app.',
            ),
            SizedBox(height: 10),
            Image.asset('assets/post_image.png'), // Add a post image
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

  List<Widget> _buildCommentsList(BuildContext context) {
    return List.generate(5, (index) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/user.png'), // Add a user avatar image
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Commenter Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'This is a sample comment. It represents a user comment on the main thread.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
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
