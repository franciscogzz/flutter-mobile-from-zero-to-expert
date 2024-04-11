import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

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
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene la instancia de chat provider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.her)
                    ? const HerMessageBubble()
                    : MyMessageBubble(message: message);
              },
            )),
            // Caja de texto para mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              // En este caso como la función sendMessage recibe solo un
              // parametro y onValue también, se puede  pasar la referencia de
              // la función.
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
