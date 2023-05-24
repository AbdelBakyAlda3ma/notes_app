import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Features/add_note/widgets/add_note_button.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/featch_notes_cubit/featch_notes_cubit.dart';
import '../../../models/note_model.dart';
import 'add_note_color_list_view.dart';
import 'add_note_text_form_field.dart';

class AddNoteBottomSheetForm extends StatefulWidget {
  const AddNoteBottomSheetForm({super.key});

  @override
  State<AddNoteBottomSheetForm> createState() => _AddNoteBottomSheetFormState();
}

class _AddNoteBottomSheetFormState extends State<AddNoteBottomSheetForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  DateTime currentDate = DateTime.now();
  late var formattedCurrentDate = DateFormat('dd-MM-yyyy').format(currentDate);

  late NoteModel note =
      NoteModel(date: formattedCurrentDate, color: 0xffab3831);
  bool absorbing = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: ((context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddNoteTextFormField(
                  maxLines: 1,
                  hintText: 'title',
                  onSaved: (value) {
                    note.title = value!;
                  },
                ),
                AddNoteTextFormField(
                  maxLines: 5,
                  hintText: 'content',
                  onSaved: (value) {
                    note.content = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AddNoteColorListView(
                  note: note,
                ),
                const SizedBox(
                  height: 16,
                ),
                AddNoteButton(
                  onPressed: () {
                    formValidate();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void formValidate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
      BlocProvider.of<FeatchNotesCubit>(context).featchNotes();
      Navigator.pop(context);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
