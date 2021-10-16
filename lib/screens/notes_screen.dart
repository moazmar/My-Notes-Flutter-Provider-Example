import 'package:flutter/material.dart';
import 'package:my_notes/providers/notes_manager.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesManager = Provider.of<NotesManager>(context);
    final notes = notesManager.noteItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes (${notes.length})"),
      ),
      floatingActionButton: FloatingActionButton(
        child:const  Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/new-note");
        },
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Text((index + 1).toString()),
            title: Text(notes[index].title),
            trailing:const  Icon(Icons.remove_red_eye_outlined),
            onTap: () {
              Navigator.of(context).pushNamed("/note", arguments: index);
            },
          );
        },
      ),
    );
  }
}
