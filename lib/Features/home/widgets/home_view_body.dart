import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/widgets/custom_note_card.dart';
import 'package:notes_app/data/notes_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return CustomNoteCard(note: noteList[index]);
          }),
    );
  }
}
