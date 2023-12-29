import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';
import 'package:flutter_application_1/functions/note_function.dart';
import 'package:flutter_application_1/screens/detailpage.dart';

import 'package:flutter_application_1/screens/notes_screen/noteadd.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  ValueNotifier<List<notemodel>> notelist = noteListNotifier;

  @override
  Widget build(BuildContext context) {
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
                  getAllnotes(); // Refresh the list after adding a new note
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 164, 250, 167),
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
                  itemCount: notelist.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        notelist.value[index].title,
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
