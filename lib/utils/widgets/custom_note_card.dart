import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/edit_note/edit_note_view.dart';
import 'package:notes_app/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../styles.dart';

class CustomNoteCard extends StatelessWidget {
  final NoteModel note;
  const CustomNoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Color(note.color!),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title!,
                        style: Styles.titleStyle,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        note.content!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.contentStyle,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    BlocProvider.of<DeleteNoteCubit>(context).deleteNote(note);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              note.date!,
              style: Styles.dateStyle,
            ),
          ],
        ),
      ),
    );
  }
}
