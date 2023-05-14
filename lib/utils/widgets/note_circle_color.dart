import 'package:flutter/material.dart';

class NoteCircleColor extends StatelessWidget {
  final Color color;
  const NoteCircleColor({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 35,
      ),
    );
  }
}
