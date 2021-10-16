import '../models/note.dart';
import 'package:flutter/foundation.dart';

class NotesManager extends ChangeNotifier {
  //This manager holds a private array of _noteItems.
  // Only the manager can change and update note items.
  final List<Note> _noteItems = [];

  //Provides a public getter method for _noteItems, which is unmodifiable.
  //External entities can only read the list of note items
  List<Note> get noteItems => List.unmodifiable(_noteItems);

  //Get the note at index in the list
  Note geNoteByIndex(int index) {
    return _noteItems[index];
  }

  //addNote() adds a new note item at the end of the list.
  void addNote(Note note) {
    _noteItems.add(note);
    notifyListeners();
  }

  //deleteNoe() deletes a note at a particular index.
  void deleteNote(int index) {
    _noteItems.removeAt(index);
    notifyListeners();
  }
}
