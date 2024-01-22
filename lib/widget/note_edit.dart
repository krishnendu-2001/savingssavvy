import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';
import 'package:flutter_application_1/functions/note_function.dart';
import 'package:flutter_application_1/widget/bottombar.dart';

class EditNotesData extends StatefulWidget {
  final String noteContent;
  final String date;
  final int index;

  const EditNotesData({
    Key? key,
    required this.noteContent,
    required this.date,
    required this.index,
  }) : super(key: key);

  @override
  State<EditNotesData> createState() => _EditDataState();
}

class _EditDataState extends State<EditNotesData> {
  TextEditingController _noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.noteContent);
    dateController = TextEditingController(text: widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple[50],
          title: const Text('Edit Notes'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _noteController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Edit date',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: dateController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Edit notes',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    edit();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> edit() async {
    final editDate = dateController.text.trim();
    final editDescription = _noteController.text.trim();

    if (editDate.isEmpty || editDescription.isEmpty) {
      return;
    } else {
      final edited = NoteModel(
        description: editDescription,
        date: editDate,
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        content: Text("Updated successfully"),
      ));
      editNotes(widget.index, edited);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    }
  }
}
