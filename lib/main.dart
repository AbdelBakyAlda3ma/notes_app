import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:notes_app/cubits/search_cubit/search_cubit.dart';
import 'package:notes_app/utils/constances.dart';
import 'package:notes_app/utils/custom_bloc_observer.dart';
import 'Features/home/home_view.dart';
import 'cubits/featch_notes_cubit/featch_notes_cubit.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatchNotesCubit()..featchNotes(),
        ),
        BlocProvider(
          create: (context) => DeleteNoteCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: ThemeData.light().textTheme,
        ),
        home: const HomeView(),
      ),
    );
  }
}
