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
                  builder: (context) => const NotesAdd(),
                ),
              );

              if (result != null) {
                setState(() {
                  notes.add(result);
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Notes',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(width: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        notes[index],
                        maxLines: 2,
                        overflow: TextOverflow
                            .ellipsis, // Display ellipsis (...) if the text overflows
                      ),
                      subtitle: Text(
                        DateTime.now().toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          delete(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Detailpage(
                            noteContent: "hhha",
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
