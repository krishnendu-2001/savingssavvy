import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? date;

  @HiveField(2)
  String? description;

  NoteModel({
    required this.description,
    required this.date,
  });

  get time => null;
}
