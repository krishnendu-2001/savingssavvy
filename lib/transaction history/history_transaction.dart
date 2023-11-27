// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const historyScreen());

class historyScreen extends StatelessWidget {
  const historyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slidable Example',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 162, 22),
            title: Center(
              child: Text('Transaction History'),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Add your back button functionality here
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView(
            children: [
              Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: const [
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color.fromARGB(255, 31, 22, 22),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.mode_edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: const ListTile(title: Text('Slide me')),
              ),
              Slidable(
                key: const ValueKey(1),
                startActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color.fromARGB(255, 31, 22, 22),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.mode_edit,
                      label: 'Edit',
                    ),
                  ],
                ),
                child: const ListTile(title: Text('Slide me')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
