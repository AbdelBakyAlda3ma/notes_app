import 'package:flutter/material.dart';

class NoteCircleColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final void Function()? onTap;
  const NoteCircleColor({
    super.key,
    required this.color,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isSelected
            ? CircleAvatar(
                backgroundColor: Colors.white,
                radius: 37,
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 35,
                ),
              )
            : CircleAvatar(
                backgroundColor: color,
                radius: 35,
              ),
      ),
    );
  }
}
