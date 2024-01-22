import 'package:hive_flutter/hive_flutter.dart';
part 'money_model.g.dart';

@HiveType(typeId: 0)
class moneymodel {
  @HiveField(0)
  String type;

  @HiveField(1)
  String amount;

  @HiveField(2)
  String description;

  @HiveField(3)
  DateTime time;

  moneymodel(
      {required this.type,
      required this.amount,
      required this.description,
      required this.time,
      e});

  get id => null;
}
