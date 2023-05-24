import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../../../utils/widgets/custom_note_card.dart';

class HomeViewNotesListView extends StatelessWidget {
  final List<NoteModel> notes;
  const HomeViewNotesListView({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return CustomNoteCard(note: notes[index]);
        });
  }
}
