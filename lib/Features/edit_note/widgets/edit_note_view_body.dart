import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'edit_note_color_list_view.dart';
import 'edit_note_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  TextEditingController titelEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();
  @override
  void initState() {
    titelEditingController.text = widget.note.title!;
    contentEditingController.text = widget.note.content!;
    super.initState();
  }

  @override
  void dispose() {
    titelEditingController.clear();
    contentEditingController.clear();
    titelEditingController.dispose();
    contentEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EditNoteTextField(
          onChanged: (value) {
            widget.note.title = value ?? titelEditingController.text;
          },
          controller: titelEditingController,
        ),
        EditNoteTextField(
          onChanged: (value) {
            widget.note.content = value ?? contentEditingController.text;
          },
          controller: contentEditingController,
          maxLines: 5,
        ),
        EditNoteColorListView(
          note: widget.note,
        ),
      ],
    );
  }
}
