import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());
  void deleteNote(NoteModel note) async {
    emit(DeleteNoteLoading());
    try {
      await note.delete();
      emit(DeleteNoteSuccess());
    } catch (e) {
      emit(DeleteNoteFailure(
        errMsg: e.toString(),
      ));
      log(e.toString());
    }
  }
}
