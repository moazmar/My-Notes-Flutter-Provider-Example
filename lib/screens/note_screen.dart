import 'package:flutter/material.dart';
import 'package:my_notes/providers/notes_manager.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteIndex = ModalRoute.of(context)!.settings.arguments as int;
    final noteProvider = Provider.of<NotesManager>(context, listen: false);
    final note = noteProvider.geNoteByIndex(noteIndex);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
      ),
      body: ListTile(
        title: Text(note.title),
        subtitle: Text(note.description),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        backgroundColor: Colors.red,
        onPressed: () {
          noteProvider.deleteNote(noteIndex);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
