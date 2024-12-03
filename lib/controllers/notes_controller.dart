import 'package:cnotes/classes/note.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesProvider = ChangeNotifierProvider((ref) => NotesController());

class NotesController extends ChangeNotifier {
  List<Note> notes = [];
  NotesController() {
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'First Nosdte',
      text: 'This is thse first note',
      color: 'blue',
      created: DateTime.now(),
    ));
    addNote(Note(
      title: 'Firstsd Note',
      text: 'This is the first note',
      color: 'blue',
      created: DateTime.now(),
    ));
  }
  void addNote(Note note) {
    notes.add(note);
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

  List<Note> getNotes() {
    return List.unmodifiable(notes);
  }
}
