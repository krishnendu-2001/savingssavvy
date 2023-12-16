import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, required note});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Details'), actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_document,
              color: Colors.amber,
            ))
      ]),
      body: Column(
        children: [],
      ),
    ));
  }
}
