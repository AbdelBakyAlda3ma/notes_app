import 'package:flutter/material.dart';

import '../../../models/note_model.dart';
import '../../../utils/widgets/custom_note_card.dart';

class SearchViewBodyListView extends StatelessWidget {
  const SearchViewBodyListView({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return CustomNoteCard(
            note: notes[index],
          );
        },
      ),
    );
  }
}
