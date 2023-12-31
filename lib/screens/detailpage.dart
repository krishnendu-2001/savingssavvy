import 'dart:math';

import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final String noteContent;
  const Detailpage({super.key, required this.noteContent});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  List<String> notes = [];
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
        children: [
          Text(
            widget.noteContent,
            style: TextStyle(fontSize: sqrt1_2),
          ),
          Text(widget.noteContent),
          // SizedBox(
          //   height: 10,
          // ),

          TextFormField(
            decoration: InputDecoration(
                hintText: 'Date', border: InputBorder.none, hintMaxLines: 1),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Text(
            '',
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Text'),
          )
        ],
      ),
    ));
  }
}
