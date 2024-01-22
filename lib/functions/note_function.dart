import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<NoteModel>> noteListNotifier = ValueNotifier([]);
// ignore: non_constant_identifier_names
Future<void> AddNotes(NoteModel value) async {
  final notesDB = await Hive.openBox<NoteModel>("noteDb_db");
  await notesDB.add(value);
  noteListNotifier.value.add(value);
  noteListNotifier.notifyListeners();
  getAllnotes();
}

Future<void> getAllnotes() async {
  final notesDB = await Hive.openBox<NoteModel>('noteDB_db');
  noteListNotifier.value.clear();
  noteListNotifier.value.addAll(notesDB.values);
  noteListNotifier.notifyListeners();
}

Future<void> delete(int index) async {
  final notesDB = await Hive.openBox<NoteModel>('noteDB_db');
  await notesDB.deleteAt(index);
  getAllnotes();
}

void editNotes(index, NoteModel value) async {
  final notesDB = await Hive.openBox<NoteModel>('noteDB_db');
  noteListNotifier.value.clear();
  noteListNotifier.value.addAll(notesDB.values as Iterable<NoteModel>);
  noteListNotifier.notifyListeners();
  notesDB.putAt(index, value as NoteModel);
  getAllnotes();
}
