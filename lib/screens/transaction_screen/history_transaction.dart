import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/money_function.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/widget/edit.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/option2.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/option3.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/options.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    getAllMoney();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'option1') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => optionScreen(history: optionScreen),
                  ),
                );
              } else if (value == 'option2') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => option2Screen(history: option2Screen),
                  ),
                );
              } else if (value == 'option3') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => option3Screen(history: option3Screen),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'option1',
                child: Text('Income'),
              ),
              const PopupMenuItem<String>(
                value: 'option2',
                child: Text('Expense'),
              ),
              const PopupMenuItem<String>(
                value: 'option3',
                child: Text('All'),
              ),
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: moneyListNotifier,
        builder:
            (BuildContext ctx, List<moneymodel> walletList, Widget? child) {
          return ListView.builder(
            itemCount: walletList.length,
            itemBuilder: (BuildContext ctx, int index) {
              final data = walletList[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    InkWell(
                      onTap: () => delet(index),
                      child: Icon(
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
                          ),
                        ),
                      ),
                      child: Icon(
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
                          color: data.type == 'income'
                              ? Colors.green[400]
                              : Color.fromRGBO(202, 15, 15, 1),
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
    );
  }
}
