import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../../../utils/constances.dart';
import '../../../utils/widgets/note_circle_color.dart';

class AddNoteColorListView extends StatefulWidget {
  final NoteModel note;
  const AddNoteColorListView({
    super.key,
    required this.note,
  });

  @override
  State<AddNoteColorListView> createState() => _AddNoteColorListViewState();
}

class _AddNoteColorListViewState extends State<AddNoteColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: noteColorsList.length,
          itemBuilder: (context, index) {
            return NoteCircleColor(
              color: noteColorsList[index],
              isSelected: currentIndex == index,
              onTap: () {
                currentIndex = index;
                widget.note.color = noteColorsList[index].value;
                setState(() {});
              },
            );
          }),
    );
  }
}
