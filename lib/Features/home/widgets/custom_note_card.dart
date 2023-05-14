import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Features/edit_note/edit_note_view.dart';
import 'package:notes_app/models/note_model.dart';

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
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: note.color,
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
                        note.title,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        note.desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xff2e4b5b),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
              note.date,
              style: const TextStyle(
                color: Color(0xff2e4b5b),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
