import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/db/model/money/money_model.dart';
import 'package:flutter_application_1/functions/money_function.dart';
import 'package:flutter_application_1/widget/bottombar.dart';

class EditData extends StatefulWidget {
  final String description;
  final String amount;
  final String type;
  final int index;

  EditData({
    Key? key,
    required this.type,
    required this.description,
    required this.amount,
    required this.index,
  }) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    typeController = TextEditingController(text: widget.type);
    descriptionController = TextEditingController(text: widget.description);
    amountController = TextEditingController(text: widget.amount);
  }

  ///????

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 108, 120, 42),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 135, 150, 0),
          title: Text('Edit Expense'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: typeController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Edit your type',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: amountController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Edit your expense',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: descriptionController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'description',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: descriptionController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'description',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    update();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update() async {
    final editedDescription = descriptionController.text.trim();
    final editedAmount = amountController.text.trim();
    final editedtype = typeController.text.trim();

    if (editedDescription.isEmpty ||
        editedAmount.isEmpty ||
        editedtype.isEmpty) {
      return;
    } else {
      final updated = moneymodel(
        description: editedDescription,
        amount: editedAmount,
        time: DateTime.now(),
        type: editedtype,
        typee: '',
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        content: Text("Updated successfully"),
      ));
      editMoney(widget.index, updated);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavigation()));
    }
  }
}
