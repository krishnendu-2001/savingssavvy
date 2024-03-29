import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<moneymodel> moneyList = moneyListNotifier.value;

    double totalIncome = 0.0;
    double totalExpense = 0.0;

    for (var transaction in moneyList) {
      if (transaction.type == 'income') {
        totalIncome += double.parse(transaction.amount);
      } else if (transaction.type == 'expense') {
        totalExpense += double.parse(transaction.amount);
      }
    }
    getAllMoney();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                height: 300,
                child: ContainedTabBarView(
                  tabs: const [
                    Text('Total'),
                    Text('Chart'),
                  ],
                  views: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Income: ${totalIncome.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18, color: Colors.green[400]),
                          ),
                          Text(
                            'Total Expense: ${totalExpense.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(202, 15, 15, 1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Stack(
                        children: [
                          PieChart(
                            swapAnimationDuration:
                                const Duration(milliseconds: 0),
                            swapAnimationCurve: Curves.bounceIn,
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  value: totalIncome,
                                  title: "Income",
                                  color: const Color.fromRGBO(118, 150, 129, 1),
                                ),
                                PieChartSectionData(
                                  value: totalExpense,
                                  title: "Expenses",
                                  color: const Color.fromRGBO(224, 123, 155, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onChange: (index) => print(index),
                ),
              ),
              const SizedBox(height: 0),
              const SizedBox(height: 20),
              Container(
                height: 30,
                width: 100,
                color: Colors.white,
                child: const Text(
                  'Recent',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
              const Divider(),
              SizedBox(
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
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
                                      : const Color.fromRGBO(202, 15, 15, 1),
                                ),
                              ),
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
