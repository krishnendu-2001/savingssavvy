import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/widget/edit.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/option2.dart';
import 'package:flutter_application_1/screens/transaction_screen/popup/options.dart';
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
          Container(
              width: 160,
              height: 35,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 238, 240),
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
                    decoration: InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                    ),
                  )),
                  Icon(Icons.search)
                ],
              )),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'option1') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IncomeScreen(history: IncomeScreen),
                  ),
                );
              } else if (value == 'option2') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExpenceScreen(history: ExpenceScreen),
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
        builder:
            (BuildContext ctx, List<moneymodel> walletList, Widget? child) {
          List<moneymodel> filteredList = walletList.where((data) {
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
