import 'dart:ui';
import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String text;
  Color color;
  DateTime created;
  bool isSelected;

  Note({
    String? id,
    required this.title,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
    required this.created,
    this.isSelected = false,
  }) : id = id ?? const Uuid().v4();

  // CopyWith method
  Note copyWith({
    String? id,
    String? title,
    String? text,
    Color? color,
    DateTime? created,
    bool? isSelected,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      color: color ?? this.color,
      created: created ?? this.created,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
