import 'package:cnotes/classes/note.dart';
import 'package:cnotes/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteView extends ConsumerWidget {
  final Note note;
  const NoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                CircleAvatar(radius: 12, backgroundColor: note.color),
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
                      ref.read(notesProvider.notifier).updateNoteColor(note.id, newColor!);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: note.title,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Note Title',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: _buildEditableLongText()),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableLongText() {
    return TextField(
      controller: TextEditingController(
        text: note.text,
      ),
      maxLines: null,
      expands: true,
      textAlignVertical: TextAlignVertical.top,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
