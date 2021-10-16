import 'package:flutter/material.dart';
import 'package:my_notes/screens/new_note_screen.dart';
import 'package:my_notes/screens/note_screen.dart';
import 'package:my_notes/screens/notes_screen.dart';
import 'package:provider/provider.dart';
import 'providers/notes_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesManager()),
      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Notes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/notes": (context) => NotesScreen(),
          "/note": (context) => NoteScreen(),
          "/new-note": (context) => NewNoteScreen()
        },
        home: NotesScreen());
  }
}
