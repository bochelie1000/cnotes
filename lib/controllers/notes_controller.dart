import 'dart:convert';

import 'package:cnotes/classes/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisibilityNotifier extends StateNotifier<List<bool>> {
  VisibilityNotifier(int length) : super(List<bool>.filled(length, true));

  void hide(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) false else state[i],
    ];
  }
}

final visibilityProvider = StateNotifierProvider.family<VisibilityNotifier, List<bool>, int>((ref, length) {
  return VisibilityNotifier(length);
});

final notesProvider = ChangeNotifierProvider((ref) => NotesController());

class NotesController extends ChangeNotifier {
  List<Note> notes = [];
  bool isNotesSelected = false;

  // NotesController() {
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Second Nosdte',
  //     text: 'This is thse second note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Thirdy third',
  //     text: 'Super third',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Forth nota',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'First Nosdte',
  //     text: 'This is thse first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  //   addNote(Note(
  //     title: 'Firstsd Note',
  //     text: 'This is the first note',
  //     color: Colors.white,
  //     created: DateTime.now(),
  //   ));
  // }

  addNote(Note note) async {
    //if note already exists, update it
    if (notes.any((element) => element.id == note.id)) {
      _updateNoteAt(notes.indexWhere((element) => element.id == note.id), note);
      return;
    } else {
      notes.add(note.copyWith(id: DateTime.now().toString()));
    }

    await saveNotes();

    notifyListeners();
  }

  // delete notes
  void deleteSelectedNotes() async {
    notes.removeWhere((note) => note.isSelected);

    isNotesSelected = notes.any((note) => note.isSelected);

    await saveNotes();

    notifyListeners();
  }

  void removeNoteAt(int index) async {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      await saveNotes();
      notifyListeners();
    }
  }

  void _updateNoteAt(int index, Note newNote) {
    if (index >= 0 && index < notes.length) {
      notes[index] = newNote.copyWith();
      notifyListeners();
    }
  }

  void updateNote(Note updatedNote) async {
    for (var note in notes) {
      if (note.id == updatedNote.id) {
        note.title = updatedNote.title;
        note.text = updatedNote.text;
        note.color = updatedNote.color;
        await saveNotes();
        notifyListeners();
        break;
      }
    }
  }

  void recolorSelectedNotes(Color color) async {
    for (var note in notes) {
      if (note.isSelected) {
        note.color = color;
      }
    }

    await saveNotes();

    notifyListeners();
  }

  void updateNoteColor(String id, Color newColor) async {
    for (var note in notes) {
      if (note.id == id) {
        note.color = newColor;
        await saveNotes();
        notifyListeners(); // Notify listeners after updating the color
        break;
      }
    }
  }

  //select note
  void select(String id) {
    for (var note in notes) {
      if (note.id == id) {
        note.isSelected = !note.isSelected;
        break;
      }
    }

    isNotesSelected = notes.any((note) => note.isSelected);

    notifyListeners();
  }

  void unselectAll() {
    for (var note in notes) {
      note.isSelected = false;
    }

    isNotesSelected = false;

    notifyListeners();
  }

  List<Note> getNotes() {
    return List.unmodifiable(notes);
  }

  // Load notes from local storage
  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? notesJson = prefs.getString('notes');
    if (notesJson != null) {
      final List<dynamic> notesList = await jsonDecode(notesJson);
      notes = notesList.map((noteJson) => Note.fromJson(noteJson)).toList();
      notifyListeners();
    }
  }

  // Save notes to local storage
  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String notesJson = jsonEncode(notes.map((note) => note.toJson()).toList());
    await prefs.setString('notes', notesJson);
  }

  // Save note by ID
  Future<void> saveNoteById(String id, Note updatedNote) async {}
}
