// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color.fromARGB(255, 255, 162, 22),
          title: const Center(
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: SafeArea(
          child: Card(
            child: ListView(
              children: [
                Divider(
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                ListTile(
                  title: Text(
                    'Reset',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(thickness: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
