import 'package:cnotes/views/main_drawer.dart';
import 'package:cnotes/views/main_view.dart';
import 'package:cnotes/views/note_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (context) => const MainView(),
        '/note_view': (context) => const NoteView(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main App'),
        ),
        drawer: const MainDrawer(),
        body: const MainView(),
      ),
    );
  }
}
