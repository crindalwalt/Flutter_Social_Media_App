import 'package:flutter/material.dart';



class ChatPage extends StatelessWidget {
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
            return _buildMessageTile(context, _messages[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMessageTile(BuildContext context, MessageItem message) {
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailPage(message.userName),
            ),
          );
        },
      ),
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String userName;

  ChatDetailPage(this.userName);

  final List<ChatMessage> _chatMessages = [
    ChatMessage('Hello!', 'assets/user.png', true, '10:30 AM'),
    ChatMessage('Hi, how are you?', 'assets/user.png', false, '10:32 AM'),
    ChatMessage('I am good, thanks!', 'assets/user.png', true, '10:33 AM'),
    ChatMessage('What about you?', 'assets/user.png', true, '10:34 AM'),
    ChatMessage('I am doing great!', 'assets/user.png', false, '10:35 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  return _buildChatBubble(_chatMessages[index]);
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: message.isMe ? Colors.blue[100] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(message.messageText),
              SizedBox(height: 5),
              Text(
                message.timestamp,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: () {
                // Handle send message action
              },
            ),
          ),
        ],
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

class ChatMessage {
  final String messageText;
  final String userImage;
  final bool isMe;
  final String timestamp;

  ChatMessage(this.messageText, this.userImage, this.isMe, this.timestamp);
}
