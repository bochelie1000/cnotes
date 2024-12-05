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

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'color': color.value,
      'created': created.toIso8601String(),
      'isSelected': isSelected,
    };
  }

  // from json
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      color: Color(json['color']),
      created: DateTime.parse(json['created']),
      isSelected: json['isSelected'],
    );
  }
}
