import 'package:cnotes/classes/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesProvider = ChangeNotifierProvider((ref) => NotesController());

class NotesController extends ChangeNotifier {
  List<Note> notes = [];
  bool isNotesSelected = false;

  NotesController() {
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Second Nosdte',
      text: 'This is thse second note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Thirdy third',
      text: 'Super third',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Forth nota',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: Colors.white,
      created: DateTime.now(),
    ));
  }

  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }

  // delete notes
  void deleteSelectedNotes() {
    notes.removeWhere((note) => note.isSelected);

    isNotesSelected = notes.any((note) => note.isSelected);

    notifyListeners();
  }

  void removeNoteAt(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      notifyListeners();
    }
  }

  void updateNoteAt(int index, Note newNote) {
    if (index >= 0 && index < notes.length) {
      notes[index] = newNote;
      notifyListeners();
    }
  }

  void recolorSelectedNotes(Color color) {
    for (var note in notes) {
      if (note.isSelected) {
        note.color = color;
      }
    }

    notifyListeners();
  }

  void updateNoteColor(String id, Color newColor) {
    for (var note in notes) {
      if (note.id == id) {
        note.color = newColor;
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
}
