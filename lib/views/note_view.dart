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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                const CircleAvatar(radius: 12, backgroundColor: Colors.orange),
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
                      // Handle color change
                    },
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Note Title',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
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
