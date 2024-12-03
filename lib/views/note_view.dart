import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                const Text('Note Title'),
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
        text: 'This is my super delux first note in CNote. CNote stands for CBS Notes.'
            'Lets see how good this will be. I am excited to see how this will turn out.'
            'Additionally I used a bit of AI to generate this text.'
            'Still most of it like this line is my own imagination.',
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
