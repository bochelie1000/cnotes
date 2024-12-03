import 'dart:ui';
import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String text;
  Color color;
  DateTime created;

  Note({
    String? id,
    required this.title,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
    required this.created,
  }) : id = id ?? const Uuid().v4();
}
