import 'package:flutter/material.dart';
import 'package:notes_app/data/note_colors_list.dart';

import 'note_circle_color.dart';

class NoteColorListView extends StatelessWidget {
  const NoteColorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: noteColorsList.length,
          itemBuilder: (context, index) {
            return NoteCircleColor(color: noteColorsList[index].color);
          }),
    );
  }
}
