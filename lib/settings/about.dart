import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 109, 194, 185),
            title: Text(
              "About",
              style: TextStyle(fontSize: 25),
            ),
          ),
          body: Center(
            child: Container(
              width: 250,
              height: 400,
              color: Colors.grey,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                shadowColor: Colors.white,
                child: Column(
                  children: [
                    Title(
                        color: Colors.black,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 30, left: 10),
                          child: Text(
                            'Savinssavvy',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Text(
                        "This application allows you to record your daily transactions based on their respective categories.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Developed by',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Krishnendu Babu',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
