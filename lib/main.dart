import 'package:flutter/material.dart';

import 'Features/home/home_view.dart';

void main() {
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
