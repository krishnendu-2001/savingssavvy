// enum CategoryType {
//   income,
//   expense,
// }

// class CategoryModel {
//   final String name;
//   final bool isDeleted;
//   final CategoryType type;

//   CategoryModel({
//     required this.name,
//     required this.type,
//     this.isDeleted = false,
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/data_model.dart';
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
