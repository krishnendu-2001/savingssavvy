import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 500,
                color: Color.fromARGB(255, 255, 162, 22),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Hey! Krishnendu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Your total balance',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '100000',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  child: PieChart(
                    swapAnimationDuration: Duration(milliseconds: 0),
                    swapAnimationCurve: Curves.bounceIn,
                    PieChartData(sections: [
                      PieChartSectionData(
                        value: 200,
                        title: "Income",
                        color: Color.fromARGB(255, 92, 172, 162),
                      ),
                      PieChartSectionData(
                        value: 350,
                        title: "Expenses",
                        color: Color.fromARGB(255, 151, 163, 169),
                      ),
                    ]),
                  ),
                ),
              ),
              Column(
                children: [
                  recent(textA: "party", textB: "03-11-2023", textC: "₹2000"),
                  SizedBox(height: 10),
                  recent(textA: "Food", textB: "3-11-2023", textC: "₹250"),
                  SizedBox(height: 10),
                  recent(textA: "Travel", textB: "3-11-2023", textC: "₹500"),
                  SizedBox(height: 10),
                  recent(textA: "Food", textB: "4-11-2023", textC: "₹150"),
                  SizedBox(height: 10),
                  recent(textA: "Salary", textB: "5-11-2023", textC: "₹50000"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container recent({
    required String textA,
    required String textB,
    required String textC,
  }) {
    return Container(
      height: 70,
      width: 500,
      color: const Color.fromARGB(255, 245, 241, 241),
      child: ListTile(
        title: Text(textA),
        subtitle: Text(textB),
        trailing: Text(textC),
      ),
    );
  }
}
