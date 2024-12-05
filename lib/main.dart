import 'dart:convert';

import 'package:cnotes/classes/note.dart';
import 'package:cnotes/controllers/notes_controller.dart';
import 'package:cnotes/views/main_drawer.dart';
import 'package:cnotes/views/notes_view.dart';
import 'package:cnotes/views/note_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isloaded = false;
  @override
  void initState() {
    super.initState();
  }

//on init
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        if (isloaded == false) {
          ref.read(notesProvider.notifier).addNote(Note(
                title: 'First Note',
                text: 'This is the first note',
                color: Colors.white,
                created: DateTime.now(),
              ));
          isloaded = true;
        }
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
      },
    );
  }
}
