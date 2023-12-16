import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/money_function.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          ListTile(
            title: Text(
              'Hey! Krishnendu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 300,
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
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
          ),
          Divider(),
          Container(
            height: 300,
            width: 500,
            child: ValueListenableBuilder(
              valueListenable: moneyListNotifier,
              builder: (BuildContext ctx, List<moneymodel> walletList,
                  Widget? child) {
                return ListView.builder(
                  itemCount: walletList.length > 5 ? 5 : walletList.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    final data = walletList[index];
                    return ListTile(
                      title: Text(data.description),
                      subtitle: Text(
                        '${data.time.year}-${data.time.day}-${data.time.month}',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data.amount,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: data.type == 'Income'
                                  ? Colors.green[400]
                                  : Color.fromARGB(255, 15, 65, 202),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const SizedBox(width: 2),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ]),
      ),
    ));
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
