import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Se puede utilizar el _ para indicar que no me interesa usar el
        // argumento, en este caso el context.
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColor: 0).theme(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
