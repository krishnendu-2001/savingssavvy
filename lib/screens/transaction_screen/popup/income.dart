import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:flutter_application_1/widget/money_edit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key, required history});

  @override
  Widget build(BuildContext context) {
    getAllMoney();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('income')),
        body: ValueListenableBuilder(
          valueListenable: moneyListNotifier,
          builder:
              (BuildContext ctx, List<moneymodel> moneyList, Widget? child) {
            // Filter expenses
            List<moneymodel> expenseList =
                moneyList.where((data) => data.type == 'income').toList();

            return ListView.builder(
              itemCount: expenseList.length,
              itemBuilder: (BuildContext ctx, int index) {
                final data = expenseList[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      InkWell(
                        onTap: () => delet(index),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditData(
                              description: data.description,
                              amount: data.amount,
                              index: index,
                              type: data.type,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  child: ListTile(
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
                            color: Colors.red, // Change to your desired color
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const SizedBox(width: 2),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
