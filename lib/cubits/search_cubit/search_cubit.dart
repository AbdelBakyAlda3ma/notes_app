import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/utils/constances.dart';
import '../../models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<NoteModel> filteredNotes = [];
  List<NoteModel> allExistingNotes = [];
  SearchCubit() : super(SearchInitial());

  void filteredSearch([String? query]) {
    var box = Hive.box<NoteModel>(kNotesBox);
    allExistingNotes = box.values.toList();

    if (allExistingNotes.isEmpty) {
      emit(SearchInEmptyList());
    } else if (query == null || query.isEmpty) {
      emit(SearchEmptyQuery());
    } else {
      filteredNotes = box.values
          .where((element) => element.title!.contains(query.toLowerCase()))
          .toList();
      if (filteredNotes.isNotEmpty) {
        emit(SearchInProgress());
      } else {
        emit(SearchNoMatchingResults());
      }
    }
  }

  @override
  String toString() {
    for (var element in filteredNotes) {
      log(element.toString());
    }
    return super.toString();
  }
}
