import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/money_function.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/screens/transaction_screen/history_transaction.dart';
import 'package:flutter_application_1/widget/bottombar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  String? selectedType;
  List<String> item = ['income', 'expense'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 350,
            color: Color.fromARGB(108, 243, 235, 211),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                type(),
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

  Padding type() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black54),
        ),
        child: DropdownButton<String>(
          value: selectedType,
          onChanged: ((value) {
            setState(() {
              selectedType = value!;
            });
          }),
          items: item
              .map((e) => DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            e,
                            style: const TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => item
              .map((e) => Row(
                    children: [
                      Text(e),
                    ],
                  ))
              .toList(),
          hint: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "type",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
        ),
      ),
    );
  }

  Future<void> onAddButtonClick() async {
    final typee = selectedType!;
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
        typee: null,
      );
      AddAmount(money);

      print("$typee, $_dateController");

      // Navigator to HistoryScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BottomNavigation(),
        ),
      );
    }
  }
}
