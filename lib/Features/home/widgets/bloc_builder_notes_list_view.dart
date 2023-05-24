import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import '../../../cubits/featch_notes_cubit/featch_notes_cubit.dart';
import 'home_view_notes_list_view.dart';

class HomeViewListViewBlocBuilder extends StatelessWidget {
  const HomeViewListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatchNotesCubit, FeatchNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<FeatchNotesCubit>(context).notes;
        return notes.isNotEmpty
            ? Expanded(
                child: HomeViewNotesListView(
                  notes: notes,
                ),
              )
            : const Center(
                child: Text(
                  "There isn't any notes yet\nAnd the search iconButton is disabled",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              );
      },
    );
  }
}
