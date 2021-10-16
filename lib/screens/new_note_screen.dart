import 'package:flutter/material.dart';
import 'package:my_notes/models/note.dart';
import '../providers/notes_manager.dart';
import 'package:provider/provider.dart';

class NewNoteScreen extends StatelessWidget {
  NewNoteScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
                controller: _titleController,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
                controller: _descriptionController,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Note newNote = Note(
                          _titleController.text, _descriptionController.text);
                      final notesManager =
                          Provider.of<NotesManager>(context, listen: false);
                      notesManager.addNote(newNote);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
