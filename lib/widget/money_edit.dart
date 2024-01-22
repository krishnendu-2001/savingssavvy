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

  const EditData({
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
  TextEditingController dateController = TextEditingController();

  String? selectedType;
  List<String> item = ['income', 'expense'];
  @override
  void initState() {
    super.initState();
    typeController = TextEditingController(text: widget.type);
    descriptionController = TextEditingController(text: widget.description);
    amountController = TextEditingController(text: widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.purple[50],
              title: const Text('Edit Expense'),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Center(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  width: 200,
                  color: const Color.fromARGB(108, 243, 235, 211),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      type(),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
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
                      const SizedBox(
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
                            dateController.text = formattedDate;
                          }
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              border: OutlineInputBorder(),
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
              )
            ]))));
  }

  Future<void> update() async {
    final editedDescription = descriptionController.text.trim();
    final editedAmount = amountController.text.trim();
    final editedtype = typeController.text.trim();

    // Get the value from the second description field

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
}
