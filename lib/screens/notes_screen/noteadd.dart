import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/note_function.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';

class NotesAdd extends StatefulWidget {
  const NotesAdd({Key? key}) : super(key: key);

  @override
  State<NotesAdd> createState() => _NotesAddState();
}

class _NotesAddState extends State<NotesAdd> {
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Use pop to go back without passing data
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none, hintMaxLines: 1, hintText: 'Title'),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintMaxLines: 1,
                hintText: 'date',
              ),
            ),
          ),
          Container(
            width: 500,
            height: 300,
            child: TextFormField(
              controller: _noteController,
              decoration: InputDecoration(
                  hintText: 'Start typing', border: InputBorder.none),
              maxLines: 6,
            ),
          ),
          TextButton(
            onPressed: () {
              onAddButtonNotes();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> onAddButtonNotes() async {
    final noteContent = _noteController.text.trim();
    if (noteContent.isEmpty) {
      return;
    } else {
      final note = notemodel(note: noteContent, date: DateTime.now());
      AddNotes(note);
      print('$noteContent');
      Navigator.of(context).pop(noteContent);
    }
  }
}
