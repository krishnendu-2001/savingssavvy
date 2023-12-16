import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class notemodel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String note;

  notemodel({
    required this.date,
    required this.note,
  });
}
