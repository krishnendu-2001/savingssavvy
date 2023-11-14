import 'package:flutter/material.dart';

class noteScreen extends StatelessWidget {
  const noteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Notes')],
        ),
      ),
    );
    ;
  }
}
