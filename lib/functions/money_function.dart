import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<moneymodel>> moneyListNotifier = ValueNotifier([]);
Future<void> AddAmount(moneymodel value) async {
  final moneyDB = await Hive.openBox<moneymodel>("money_db");
  await moneyDB.add(value);
  moneyListNotifier.value.add(value);
  moneyListNotifier.notifyListeners();
  getAllMoney();
}

Future<void> getAllMoney() async {
  final moneyDB = await Hive.openBox<moneymodel>('money_db');
  moneyListNotifier.value.clear();
  moneyListNotifier.value.addAll(moneyDB.values);
  moneyListNotifier.notifyListeners();
}

Future<void> delet(int index) async {
  final Moneydb = await Hive.openBox<moneymodel>('money_db');
  await Moneydb.deleteAt(index);
  getAllMoney();
}

Future<void> editMoney(moneymodel value) async {
  final moneyDB = await Hive.openBox<moneymodel>('money_db');
  moneyDB.put(value.id, value);
  moneyListNotifier.notifyListeners();
  getAllMoney();
}
