import 'package:flutter/material.dart';

class optionScreen extends StatelessWidget {
  const optionScreen({super.key, required history});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('options')),
      body: Column(
        children: [],
      ),
    ));
  }
}
