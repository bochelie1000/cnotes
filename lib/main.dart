import 'package:cnotes/classes/note.dart';
import 'package:cnotes/views/main_drawer.dart';
import 'package:cnotes/views/notes_view.dart';
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
      onGenerateRoute: (settings) {
        if (settings.name == '/note_view') {
          final Note note = settings.arguments as Note;
          return MaterialPageRoute(
            builder: (context) {
              return NoteView(note: note);
            },
          );
        }
        // Handle other routes here
        return null;
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main App'),
        ),
        drawer: const MainDrawer(),
        body: const NotesView(),
      ),
    );
  }
}
