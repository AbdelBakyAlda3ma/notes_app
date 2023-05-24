import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../cubits/delete_note_cubit/delete_note_cubit.dart';
import '../../../cubits/featch_notes_cubit/featch_notes_cubit.dart';
import '../../../cubits/search_cubit/search_cubit.dart';
import 'home_view_scaffold.dart';

class BlocBuilderHomeViewScaffold extends StatelessWidget {
  const BlocBuilderHomeViewScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteNoteCubit, DeleteNoteState>(
      builder: (context, state) {
        if (state is DeleteNoteSuccess) {
          BlocProvider.of<FeatchNotesCubit>(context).featchNotes();
          BlocProvider.of<SearchCubit>(context).filteredSearch();
          return const ModalProgressHUD(
            inAsyncCall: false,
            child: HomeViewScaffold(),
          );
        } else if (state is DeleteNoteFailure) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  state.errMsg,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        } else if (state is DeleteNoteLoading) {
          return const ModalProgressHUD(
            inAsyncCall: true,
            child: HomeViewScaffold(),
          );
        } else {
          return const HomeViewScaffold();
        }
      },
    );
  }
}
