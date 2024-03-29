import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/widget/money_edit.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/expence.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/income.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    getAllMoney();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        elevation: 0,
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
              width: 170,
              height: 35,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                    ),
                  )),
                  const Icon(Icons.search)
                ],
              )),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'option1') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const IncomeScreen(history: IncomeScreen),
                  ),
                );
              } else if (value == 'option2') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const ExpenceScreen(history: ExpenceScreen),
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
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: moneyListNotifier,
        builder: (BuildContext ctx, List<moneymodel> moneyList, Widget? child) {
          List<moneymodel> filteredList = moneyList.where((data) {
            return data.description
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
          }).toList();
          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext ctx, int index) {
              final data = filteredList[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    InkWell(
                      onTap: () => showDeleteConfirmationDialog(context, index),
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
                          color: data.type == 'income'
                              ? Colors.green[400]
                              : const Color.fromRGBO(202, 15, 15, 1),
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

  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this chapter?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await delet(index);
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
