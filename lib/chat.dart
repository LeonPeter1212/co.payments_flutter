import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Co Help',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1D3A70),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xFFE5E7EB),
                ),
              ),
            ),
            child: Image.asset(
              'assets/images/back-light.png',
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/cobot.png', // Replace with the actual image path
              height: 60,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                // Chat messages
                ChatMessage(
                  message: 'Hello! My name is Co',
                  sender: Sender.Recipient,
                ),
                ChatMessage(
                  message: 'Tommy Jason',
                  sender: Sender.User,
                ),
                ChatMessage(
                  message:
                      'Hello! Tommy 👋. I can converse in your preferred language. How may I help you today?',
                  sender: Sender.Recipient,
                ),
                ChatMessage(
                  message: 'How to create a Co.payment account?',
                  sender: Sender.User,
                ),
                ChatMessage(
                  message: '•••',
                  sender: Sender.Recipient,
                  // isTyping: true,
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Handle link icon click
                    },
                    icon: const Icon(
                      Icons.link,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type here...',
                      hintStyle: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(16),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xFF1D3A70),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle send message
                  },
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xFF1DAB87),
                      ),
                      // Icon(
                      //   Icons.chevron_right,
                      //   color: Color(0xFF1DAB87),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum Sender { Recipient, User }

class ChatMessage extends StatelessWidget {
  final String message;
  final Sender sender;
  final bool isTyping;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.sender,
    this.isTyping = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Align(
        alignment:
            sender == Sender.Recipient ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: sender == Sender.Recipient
                // ? const Color.fromARGB(255, 199, 202, 206)
                ? Color(0xFFF9FAFB)
                : const Color(0xFF1D3A70),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sender == Sender.Recipient ? 0 : 16),
              topRight: Radius.circular(sender == Sender.Recipient ? 16 : 0),
              bottomLeft: const Radius.circular(16),
              bottomRight: const Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                    fontSize: 14,
                    color: sender == Sender.Recipient
                        ? const Color(0xFF1D3A70)
                        : Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              if (isTyping) const SizedBox(height: 8),
              if (isTyping)
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF1D3A70)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(),
      home: ChatPage(),
    );
  }
}
