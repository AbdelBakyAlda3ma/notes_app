import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/edit_note/widgets/edit_note_view_body.dart';
import 'package:notes_app/cubits/featch_notes_cubit/featch_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/widgets/custom_app_bar.dart';

import '../../cubits/search_cubit/search_cubit.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                note.save();
                BlocProvider.of<FeatchNotesCubit>(context).featchNotes();
                BlocProvider.of<SearchCubit>(context).filteredSearch();

                Navigator.pop(context);
              },
            ),
            EditNoteViewBody(
              note: note,
            ),
          ],
        ),
      ),
    );
  }
}
