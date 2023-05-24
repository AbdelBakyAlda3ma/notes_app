import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../search_view_body_list_view.dart';

class SearchInProgressView extends StatelessWidget {
  final List<NoteModel> notes;
  const SearchInProgressView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return SearchViewBodyListView(notes: notes);
  }
}
