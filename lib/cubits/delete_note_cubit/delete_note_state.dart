// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_note_cubit.dart';

@immutable
abstract class DeleteNoteState {}

class DeleteNoteInitial extends DeleteNoteState {}

class DeleteNoteLoading extends DeleteNoteState {}

class DeleteNoteSuccess extends DeleteNoteState {}

class DeleteNoteFailure extends DeleteNoteState {
  final String errMsg;
  DeleteNoteFailure({
    required this.errMsg,
  });
}
