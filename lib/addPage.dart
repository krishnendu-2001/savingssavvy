import 'package:flutter/material.dart';

class addScreen extends StatelessWidget {
  const addScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 140,
            ),
            Container(
              height: 600,
              width: 400,
              color: Color.fromARGB(255, 255, 162, 22),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  textformfiled(
                    about: 'Name',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  textformfiled(about: 'Explain'),
                  SizedBox(
                    height: 30,
                  ),
                  textformfiled(
                    about: 'Amount',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  textformfiled(
                    about: 'Type',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'date',
                        style: TextStyle(
                            color: Color.fromARGB(255, 189, 179, 179)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 11, 11, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text('Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ))),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Container textformfiled({required String about}) {
    return Container(
      height: 50,
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          about,
          style: TextStyle(color: const Color.fromARGB(255, 211, 198, 198)),
        ),
      ),
    );
  }
}
