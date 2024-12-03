import 'dart:ui';

class Note {
  String title;
  String text;
  Color color;
  DateTime created;

  Note({
    required this.title,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
    required this.created,
  });
}
