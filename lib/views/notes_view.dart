import 'package:cnotes/classes/note.dart';
import 'package:cnotes/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesView extends ConsumerWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Note> notes = ref.watch(notesProvider).notes; // Watch the provider directly

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
                  shrinkWrap: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 500
                        ? 2
                        : MediaQuery.of(context).size.width < 600
                            ? 3
                            : MediaQuery.of(context).size.width < 800
                                ? 4
                                : 6,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    Note note = notes[index];
                    return SizedBox(
                      child: Card(
                        color: note.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  note.text,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ), // Assuming Note has a content field
                          ),
                          onTap: () {
                            // navigate to note_view
                            Navigator.pushNamed(context, '/note_view', arguments: note);
                          },
                        ),
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
                tooltip: 'Add note',
                child: const Icon(Icons.add),
                onPressed: () {
                  // navigate to note_view
                  Navigator.pushNamed(
                    context,
                    '/note_view',
                    arguments: Note(title: '', text: '', color: Colors.white, created: DateTime.now()),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
