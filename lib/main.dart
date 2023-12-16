import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/db/model/note/note_model.dart';
import 'package:flutter_application_1/widget/bottombar.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(moneymodelAdapter().typeId)) {
    Hive.registerAdapter(moneymodelAdapter());
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(moneymodelAdapter().typeId)) {
    Hive.registerAdapter(notemodelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavigation(),
    );
  }
}
