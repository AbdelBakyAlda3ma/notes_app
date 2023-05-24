import 'package:flutter/material.dart';
import '../../../../models/note_model.dart';
import '../search_view_body_list_view.dart';

class SearchInitialAndEmptyQueryView extends StatelessWidget {
  final List<NoteModel> notes;

  const SearchInitialAndEmptyQueryView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return SearchViewBodyListView(notes: notes);
  }
}
