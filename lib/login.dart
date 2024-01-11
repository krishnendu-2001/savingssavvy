import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.lock,
              size: 300,
            ),
            SizedBox(
              height: 50,
            ),
            Text('welcome back')
          ],
        ),
      ),
    );
  }
}