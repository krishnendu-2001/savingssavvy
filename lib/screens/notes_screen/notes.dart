import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/note_function.dart';
import 'package:flutter_application_1/screens/detailpage.dart';

import 'package:flutter_application_1/screens/notes_screen/noteadd.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    // Assuming getAllnotes() retrieves notes and updates the notes list
    getAllnotes();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              var result = await Navigator.of(context).push<String>(
                MaterialPageRoute(
                  builder: (context) => NotesAdd(),
                ),
              );

              if (result != null) {
                setState(() {
                  notes.add(result);
                });
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Notes',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(width: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        notes[index],
                        maxLines: 2, // Set the maximum number of lines
                        overflow: TextOverflow
                            .ellipsis, // Display ellipsis (...) if the text overflows
                      ),
                      // Assuming you want to display the current date for each note
                      subtitle: Text(
                        '${DateTime.now().toString()}',
                        maxLines: 2, // Set the maximum number of lines
                        overflow: TextOverflow
                            .ellipsis, // Display ellipsis (...) if the text overflows
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          delete(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detailpage(
                            note: Detailpage,
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
