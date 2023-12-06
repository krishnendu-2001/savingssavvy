import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Hey! Krishnendu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // Container(
              //   height: 50,
              //   width: 500,
              //   color: Colors.white,
              //   child: Stack(
              //     children: [
              //       Positioned(
              //         top: 0,
              //         left: 0,
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             'Hey! Krishnendu',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 220,
                        left: 170,
                        child: Text('₹100000'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Title(
                          color: Colors.black,
                          child: Text(
                            'Your total balance',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      PieChart(
                        swapAnimationDuration: Duration(milliseconds: 0),
                        swapAnimationCurve: Curves.bounceIn,
                        PieChartData(sections: [
                          PieChartSectionData(
                            value: 200,
                            title: "Income",
                            color: Color.fromRGBO(118, 150, 129, 1),
                          ),
                          PieChartSectionData(
                            value: 350,
                            title: "Expenses",
                            color: Color.fromRGBO(224, 123, 155, 1),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Color.fromRGBO(118, 150, 129, 1),
                    ),
                  ),
                  Text("Income")
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Color.fromRGBO(224, 123, 155, 1),
                    ),
                  ),
                  Text("Expense")
                ],
              ),

              SizedBox(
                height: 40,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.white,
                child: Text('Recent',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
              ),
              Divider(),
              Column(
                children: [
                  ListTile()
                  // recent(textA: "party", textB: "03-11-2023", textC: "₹2000"),
                  // SizedBox(height: 1),
                  // recent(textA: "Food", textB: "3-11-2023", textC: "₹250"),
                  // SizedBox(height: 1),
                  // recent(textA: "Travel", textB: "3-11-2023", textC: "₹500"),
                  // SizedBox(height: 1),
                  // recent(textA: "Food", textB: "4-11-2023", textC: "₹150"),
                  // SizedBox(height: 1),
                  // recent(textA: "Salary", textB: "5-11-2023", textC: "₹50000"),
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
        height: 60,
        width: 500,
        color: const Color.fromARGB(255, 245, 241, 241),
        child: ListTile(
          title: Text(textA),
          subtitle: Text(textB),
          trailing: Text(textC),

          // ListTile(
          //   title: Text('hgfsd'),
          //   subtitle: Text('sdf'),
          //   trailing: Text('dfdf'),
          // ),
          // Divider(
          //   thickness: 2,
          // ),
          // ListTile(
          //   title: Text('hgfsd'),
          //   subtitle: Text('sdf'),
          //   trailing: Text('dfdf'),
          // ),
          // Divider(
          //   thickness: 2,
          // ),
          // ListTile(
          //   title: Text('hgfsd'),
          //   subtitle: Text('sdf'),
          //   trailing: Text('dfdf'),
          // ),
          // Divider(
          //   thickness: 2,
          // ),
          // ListTile(
          //   title: Text('hgfsd'),
          //   subtitle: Text('sdf'),
          //   trailing: Text('dfdf'),
          // ),
          // Divider(
          //   thickness: 2,
          // ),
          // ListTile(
          //   title: Text('hgfsd'),
          //   subtitle: Text('sdf'),
          //   trailing: Text('dfdf'),
          // ),
          // Divider(
          //   thickness: 2,
          // )
        ));
  }
}
