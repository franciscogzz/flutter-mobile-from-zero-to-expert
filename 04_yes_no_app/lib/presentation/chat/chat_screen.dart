import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.OwWmQdIJESctxNEgRS2S1gHaKw?rs=1&pid=ImgDetMain'),
          ),
        ),
        title: const Text('Alessandra Daddario'),
        centerTitle: false,
      ),
    );
  }
}
