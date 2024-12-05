import 'package:cnotes/classes/note.dart';
import 'package:cnotes/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesView extends ConsumerWidget {
  const NotesView({super.key});

  void deleteNoteWithAnimation(BuildContext context, WidgetRef ref, int index) {
    ref.read(visibilityProvider(ref.watch(notesProvider).notes.length).notifier).hide(index);
    Future.delayed(Duration(milliseconds: 500), () {
      ref.read(notesProvider.notifier).removeNoteAt(index);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Note> notes = ref.watch(notesProvider).notes; // Watch the provider directly
    List<bool> isVisible = ref.watch(visibilityProvider(notes.length));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //add menu for isNotesSelected
              if (ref.watch(notesProvider).isNotesSelected)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          // unselect all notes
                          ref.read(notesProvider.notifier).unselectAll();
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // delete selected notes
                              // ref.read(notesProvider.notifier).deleteSelectedNotes();
                              for (int i = 0; i < notes.length; i++) {
                                if (notes[i].isSelected) {
                                  deleteNoteWithAnimation(context, ref, i);
                                }
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // CircleAvatar(radius: 12, backgroundColor: note.color),
                              // available colors
                              DropdownButtonHideUnderline(
                                child: DropdownButton<Color>(
                                  icon: const Icon(Icons.color_lens),
                                  items: const [
                                    DropdownMenuItem(
                                      value: Colors.white,
                                      child: CircleAvatar(backgroundColor: Colors.white),
                                    ),
                                    DropdownMenuItem(
                                      value: Colors.lightBlue,
                                      child: CircleAvatar(backgroundColor: Colors.lightBlue),
                                    ),
                                    DropdownMenuItem(
                                      value: Colors.lightGreen,
                                      child: CircleAvatar(backgroundColor: Colors.lightGreen),
                                    ),
                                    DropdownMenuItem(
                                      value: Colors.purpleAccent,
                                      child: CircleAvatar(backgroundColor: Colors.purpleAccent),
                                    ),
                                    DropdownMenuItem(
                                      value: Colors.brown,
                                      child: CircleAvatar(backgroundColor: Colors.brown),
                                    ),
                                    DropdownMenuItem(
                                      value: Colors.yellow,
                                      child: CircleAvatar(backgroundColor: Colors.yellow),
                                    ),
                                    DropdownMenuItem(
                                      value: Colors.orange,
                                      child: CircleAvatar(backgroundColor: Colors.orange),
                                    ),
                                  ],
                                  onChanged: (Color? newColor) {
                                    ref.read(notesProvider.notifier).recolorSelectedNotes(newColor!);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

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
                      child: AnimatedRotation(
                        turns: isVisible[index] ? 2.0 : 0.0,
                        curve: Curves.easeInToLinear,
                        duration: Duration(milliseconds: 200),
                        child: Card(
                          elevation: note.isSelected ? 4 : 2,
                          color: note.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: note.isSelected ? Colors.red : Colors.transparent,
                              width: 2,
                            ),
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
                              if (ref.read(notesProvider).isNotesSelected) {
                                ref.read(notesProvider.notifier).select(note.id);
                              } else {
                                Navigator.pushNamed(context, '/note_view', arguments: note);
                              }
                            },
                            onLongPress: () {
                              //mark note as selected
                              ref.read(notesProvider.notifier).select(note.id);
                            },
                          ),
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
