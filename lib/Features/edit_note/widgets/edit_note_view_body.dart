import 'package:flutter/material.dart';

import '../../../utils/widgets/note_color_list_view.dart';
import 'edit_note_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        EditNoteTextField(),
        EditNoteTextField(
          maxLines: 5,
        ),
        NoteColorListView(),
      ],
    );
  }
}
