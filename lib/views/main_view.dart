import 'package:cnotes/classes/note.dart';
import 'package:cnotes/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Note> notes = ref.watch(notesProvider.notifier).getNotes();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 400
                        ? 2
                        : MediaQuery.of(context).size.width < 900
                            ? 4
                            : 6,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    Note note = notes[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(note.text), // Assuming Note has a content field
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16.0, bottom: 40),
              child: FloatingActionButton(
                tooltip: 'Increment',
                child: const Icon(Icons.add),
                onPressed: () {
                  // navigate to note_view
                  Navigator.pushNamed(context, '/note_view');
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
