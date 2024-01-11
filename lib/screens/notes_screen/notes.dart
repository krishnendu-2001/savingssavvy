import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';
import 'package:flutter_application_1/functions/note_function.dart';
import 'package:flutter_application_1/screens/notes_screen/noteadd.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    getAllnotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var result = await Navigator.of(context).push<String>(
                MaterialPageRoute(builder: (context) => const NotesAdd()),
              );
              // if (result != null) {
              //   setState(() {
              //     notes.add(result);
              //   });
              // }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: noteListNotifier,
        builder: (BuildContext ctx, List<NoteModel> notesList, Widget? child) {
          return ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
              final notess = notesList[index];
              return Card(
                child: ListTile(
                  title: Text(notess.description.toString()),
                  subtitle: Text(
                    '${notess.date}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () =>
                            showDeleteConfirmationDialog(context, index),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: notesList.length,
          );
        },
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this chapter?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await delete(index);
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
