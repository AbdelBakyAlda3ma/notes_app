import 'package:flutter/material.dart';
import 'package:notes_app/Features/add_note/widgets/add_note_button.dart';
import 'package:notes_app/Features/add_note/widgets/add_note_text_form_field.dart';
import 'package:notes_app/utils/widgets/note_color_list_view.dart';

class AddNoteBottomSheetView extends StatefulWidget {
  const AddNoteBottomSheetView({super.key});

  @override
  State<AddNoteBottomSheetView> createState() => _AddNoteBottomSheetViewState();
}

class _AddNoteBottomSheetViewState extends State<AddNoteBottomSheetView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AddNoteTextFormField(
                maxLines: 1,
                hintText: 'title',
              ),
              const AddNoteTextFormField(
                maxLines: 5,
                hintText: 'content',
              ),
              const SizedBox(
                height: 16,
              ),
              const NoteColorListView(),
              const SizedBox(
                height: 16,
              ),
              AddNoteButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
