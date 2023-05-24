import 'package:flutter/material.dart';
import 'package:notes_app/utils/styles.dart';

class AddNoteTextFormField extends StatelessWidget {
  final int maxLines;
  final String? hintText;
  final void Function(String?)? onSaved;

  const AddNoteTextFormField(
      {super.key, required this.maxLines, this.hintText, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is requried';
          }
          return null;
        },
        maxLines: maxLines,
        style: Styles.textFieldInputStyle,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
          border: buildBorder(),
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
