// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/money_function.dart';

import 'package:flutter_application_1/db/model/money/money_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the list of transactions
    List<moneymodel> moneyList = moneyListNotifier.value;

    // Calculate total income and total expense
    double totalIncome = 0.0;
    double totalExpense = 0.0;

    moneyList.forEach((transaction) {
      if (transaction.type == 'income') {
        totalIncome += double.parse(transaction.amount);
      } else if (transaction.type == 'expense') {
        totalExpense += double.parse(transaction.amount);
      }
    });

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
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  child: Stack(
                    children: [
                      PieChart(
                        swapAnimationDuration: Duration(milliseconds: 0),
                        swapAnimationCurve: Curves.bounceIn,
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: totalIncome,
                              title: "Income",
                              color: Color.fromRGBO(118, 150, 129, 1),
                            ),
                            PieChartSectionData(
                              value: totalExpense,
                              title: "Expenses",
                              color: Color.fromRGBO(224, 123, 155, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust spacing as needed
              Text(
                'Total Income: ${totalIncome.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, color: Colors.green[400]),
              ),
              Text(
                'Total Expense: ${totalExpense.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(202, 15, 15, 1)),
              ),
              SizedBox(height: 20),
              Container(
                height: 30,
                width: 100,
                color: Colors.white,
                child: Text(
                  'Recent',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
              Divider(),
              Container(
                height: 300,
                width: 500,
                child: ValueListenableBuilder(
                  valueListenable: moneyListNotifier,
                  builder: (BuildContext ctx, List<moneymodel> moneyList,
                      Widget? child) {
                    return ListView.builder(
                      itemCount: moneyList.length > 5 ? 5 : moneyList.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        final data = moneyList[index];
                        return ListTile(
                          title: Text(data.description,
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                                  color: data.type == 'income'
                                      ? Colors.green[400]
                                      : Color.fromRGBO(202, 15, 15, 1),
                                ),
                              ),
                              const SizedBox(width: 2),
                              const SizedBox(width: 2),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
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
        ));
  }
}
