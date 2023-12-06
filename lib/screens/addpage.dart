import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/function.dart';
import 'package:flutter_application_1/db/model/data_model.dart';
import 'package:flutter_application_1/screens/transaction%20history/history_transaction.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _typeController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 600,
            width: 350,
            color: Color.fromARGB(108, 243, 235, 211),
            child: Column(
              children: [
                TextFormField(
                  controller: _typeController,
                  decoration: InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    onAddButtonClick();
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddButtonClick() async {
    final typee = _typeController.text.trim();
    final amountt = _amountController.text.trim();
    final descriptionn = _descriptionController.text.trim();
    final date = _dateController.text.trim();

    if (typee.isEmpty || amountt.isEmpty || descriptionn.isEmpty) {
      return;
    } else {
      final money = moneymodel(
        type: typee,
        amount: amountt,
        description: descriptionn,
        time: DateTime.now(),
      );
      AddAmount(money);

      print("$typee, $_dateController");

      // Navigator to HistoryScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TransactionHistory(),
        ),
      );
    }
  }
}
