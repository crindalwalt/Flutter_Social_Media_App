import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxPage extends StatelessWidget {
  final List<MessageItem> _messages = [
    MessageItem('User1', 'Hey, how are you?', '1m', 'assets/user.png'),
    MessageItem('User2', 'Let\'s catch up tomorrow!', '5m', 'assets/user.png'),
    MessageItem('User3', 'Did you see the news?', '10m', 'assets/user.png'),
    MessageItem('User4', 'Happy Birthday!', '1h', 'assets/user.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
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
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            return _buildMessageTile(_messages[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMessageTile(MessageItem message) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(message.userImage),
        ),
        title: Text(
          message.userName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message.messageText),
        trailing: Text(message.timestamp),
        onTap: () {
          // Handle message tap, navigate to detailed chat view
        },
      ),
    );
  }
}

class MessageItem {
  final String userName;
  final String messageText;
  final String timestamp;
  final String userImage;

  MessageItem(this.userName, this.messageText, this.timestamp, this.userImage);
}
