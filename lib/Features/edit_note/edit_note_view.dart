import 'package:flutter/material.dart';
import 'package:notes_app/Features/edit_note/widgets/edit_note_view_body.dart';
import 'package:notes_app/utils/widgets/custom_app_bar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: const [
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          EditNoteViewBody(),
        ]),
      ),
    );
  }
}
