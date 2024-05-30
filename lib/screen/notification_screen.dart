import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationItem> _notifications = [
    NotificationItem('User1', 'liked your post', '👍', '5m', 'assets/user.png'),
    NotificationItem('User2', 'commented on your photo', '💬', '10m', 'assets/user.png'),
    NotificationItem('User3', 'started following you', '👥', '1h', 'assets/user.png'),
    NotificationItem('User4', 'shared your post', '🔄', '2h', 'assets/user.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(_notifications[index].timestamp),
              onDismissed: (direction) {
                setState(() {
                  _notifications.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notification dismissed')),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: _buildNotificationTile(_notifications[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationTile(NotificationItem notification) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(notification.userImage),
        ),
        title: Text(
          notification.userName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(notification.action),
            SizedBox(width: 5),
            Text(notification.emoji),
          ],
        ),
        trailing: Text(notification.timestamp),
      ),
    );
  }
}

class NotificationItem {
  final String userName;
  final String action;
  final String emoji;
  final String timestamp;
  final String userImage;

  NotificationItem(this.userName, this.action, this.emoji, this.timestamp, this.userImage);
}
