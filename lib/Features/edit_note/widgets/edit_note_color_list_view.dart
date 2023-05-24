import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../../../utils/constances.dart';
import '../../../utils/widgets/note_circle_color.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

class EditNoteColorListView extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorListView({
    super.key,
    required this.note,
  });

  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int currentIndex;
  ScrollController scrollController = ScrollController();
  late ListObserverController observerController =
      ListObserverController(controller: scrollController);
  @override
  void initState() {
    currentIndex = noteColorsList.indexOf(Color(widget.note.color!));
    observerController.initialIndex = currentIndex;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    log(currentIndex.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListViewObserver(
        controller: observerController,
        child: ListView.builder(
          controller: scrollController,
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
          },
        ),
      ),
    );
  }
}
