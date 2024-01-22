// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:flutter_application_1/widget/bottombar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? selectedType;
  List<String> item = ['income', 'expense'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: 200,
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
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter the amount";
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter the description";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      if (selectedDate != null) {
                        String formattedDate =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        _dateController.text = formattedDate;
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                      ),
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
      ),
    );
  }

  Padding type() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 2, color: Colors.black54),
        ),
        child: DropdownButtonFormField<String>(
          value: selectedType,
          onChanged: (value) {
            setState(() {
              selectedType = value!;
            });
          },
          items: item
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        Text(
                          e,
                          style: const TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ))
              .toList(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Future<void> onAddButtonClick() async {
    if (_formKey.currentState!.validate()) {
      final typee = selectedType!;
      final amountt = _amountController.text.trim();
      final descriptionn = _descriptionController.text.trim();
      final time = _dateController.text.trim();

      if (typee.isEmpty ||
          amountt.isEmpty ||
          descriptionn.isEmpty ||
          time.isEmpty) {
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
            builder: (context) => BottomNavigation(),
          ),
        );
      }
    }
  }
}
