import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<notemodel>> noteListNotifier = ValueNotifier([]);
Future<void> AddNotes(notemodel value) async {
  final notesDB = await Hive.openBox<notemodel>("noteDb_db");
  await notesDB.add(value);
  noteListNotifier.value.add(value);
  noteListNotifier.notifyListeners();
  getAllnotes();
}

Future<void> getAllnotes() async {
  final notesDB = await Hive.openBox<notemodel>('noteDB_db');
  noteListNotifier.value.clear();
  noteListNotifier.value.addAll(notesDB.values);
  noteListNotifier.notifyListeners();
}

Future<void> delete(int index) async {
  final notesDB = await Hive.openBox<notemodel>('noteDB_db');
  await notesDB.deleteAt(index);
  getAllnotes();
}

void editMoney(index, moneymodel value) async {
  final moneyDB = await Hive.openBox<moneymodel>('money_db');
  moneyListNotifier.value.clear();
  moneyListNotifier.value.addAll(moneyDB.values);
  moneyListNotifier.notifyListeners();
  moneyDB.putAt(index, value);
  getAllMoney();
}
