import 'package:flutter/material.dart';
import 'package:notes_app/utils/styles.dart';

class EditNoteTextField extends StatelessWidget {
  final int maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  const EditNoteTextField(
      {super.key,
      this.maxLines = 1,
      this.hintText,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        maxLines: maxLines,
        style: Styles.textFieldInputStyle,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
