// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import 'package:notes_app/models/note_model.dart';

import '../../utils/constances.dart';

part 'featch_notes_state.dart';

class FeatchNotesCubit extends Cubit<FeatchNotesState> {
  List<NoteModel> notes = [];
  FeatchNotesCubit() : super(FeatchNotesInitial());
  void featchNotes() {
    var box = Hive.box<NoteModel>(kNotesBox);
    notes = box.values.toList();
    emit(FeatchNotesDone());
  }
}
