import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/home_view.dart';
import 'models/note_model.dart';

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Box notesBox = await Hive.openBox<NoteModel>('notesBox');

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: ThemeData.light().textTheme,
      ),
      home: const HomeView(),
    );
  }
}
