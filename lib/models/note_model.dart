import 'package:flutter/material.dart';

class NoteModel {
  final String title;
  final String desc;
  final String date;
  final Color color;
  NoteModel({
    required this.title,
    required this.desc,
    required this.date,
    required this.color,
  });
}
