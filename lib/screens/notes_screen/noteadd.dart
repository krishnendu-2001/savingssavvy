import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/note_function.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';

class NotesAdd extends StatefulWidget {
  final String? noteContent;

  const NotesAdd({Key? key, this.noteContent}) : super(key: key);

  @override
  State<NotesAdd> createState() => _NotesAddState();
}

class _NotesAddState extends State<NotesAdd> {
  final _noteController = TextEditingController();
  final descriptioncon = TextEditingController();
  final datecontr = TextEditingController();
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    _noteController.text = widget.noteContent ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: descriptioncon,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintMaxLines: 1,
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              if (selectedDate != null) {
                String formattedDate =
                    "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                datecontr.text = formattedDate;
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: datecontr,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 500,
            height: 300,
            child: TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Start typing',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
          ),
          TextButton(
            onPressed: () {
              onAddButtonNotes();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> onAddButtonNotes() async {
    final noteContent = _noteController.text.trim();
    final notee = descriptioncon.text.trim.toString();
    final datee = datecontr.text.trim();
    if (noteContent.isEmpty) {
      return;
    } else {
      final note =
          NoteModel(title: notee, date: datee, description: noteContent);
      AddNotes(note);
      log(noteContent);

      Navigator.of(context).pop(noteContent);
    }
  }
}
