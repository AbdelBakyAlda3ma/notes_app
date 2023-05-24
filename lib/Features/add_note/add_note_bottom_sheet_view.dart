import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/add_note/widgets/add_note_bottom_sheet_form.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class AddNoteBottomSheetView extends StatelessWidget {
  const AddNoteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocProvider(
          create: (context) => AddNoteCubit(),
          child: const AddNoteBottomSheetForm(),
        ),
      ),
    );
  }
}
