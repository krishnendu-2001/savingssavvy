import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class notemodel {
  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  notemodel(
      {required this.title, required this.description, required String date});
}
