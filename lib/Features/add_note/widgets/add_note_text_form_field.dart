import 'package:flutter/material.dart';

class AddNoteTextFormField extends StatelessWidget {
  final int maxLines;
  final String? hintText;

  const AddNoteTextFormField(
      {super.key, required this.maxLines, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        onSaved: (value) {},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is requried';
          }
          return null;
        },
        maxLines: maxLines,
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
