import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/function.dart';
import 'package:flutter_application_1/db/model/data_model.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  // String _search = "";
  // List<moneymodel> searchedList = [];

  // @override
  // void initState() {
  //   getAllMoney();
  //   searchedList = moneyListNotifier.value;
  //   super.initState();
  // }

  // void searchResult() {
  //   searchedList = moneyListNotifier.value
  //       .where((statementModel) => statementModel.description
  //           .toLowerCase()
  //           .contains(_search.toLowerCase()))
  //       .toList();
  // }

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
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Container(
                  height: 45,
                  width: 120,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: TextField(
                    onChanged: (value) {
                      // setState(() {
                      //   _search = value;
                      // });
                      // searchResult();
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
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
                return ListTile(
                  title: Text(data.description),
                  subtitle: Text(
                    '${data.time.year}-${data.time.day}-${data.time.month}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.amount.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: data.type == 'Income'
                                ? Colors.green[400]
                                : Color.fromARGB(255, 15, 65, 202)),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  " Delete Data",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  " You are going to delete this data",
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      // deleteData(index);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 2),
                    ],
                  ),
                );
              },
            );
          },
        )
        // if (searchedList.isEmpty) {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       // children: [
        //       //   Image.network(
        //       //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstoryset.com%2Fno-data&psig=AOvVaw088nUMAl6VNxCAA1xYvN8D&ust=1701761120507000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCPjl8qqg9YIDFQAAAAAdAAAAABAE', // Add your image path here
        //       //     height: 150,
        //       //     width: 150,
        //       //   ),
        //       //   const SizedBox(height: 10),
        //       //   Text(
        //       //     'No results found',
        //       //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //       //   ),
        //       // ],
        //     ),
        //   );
        // }
        //     return ListView.separated(
        //       itemBuilder: (ctx, index) {
        //         final data = walletList[index];
        //         return ListTile(
        //           title: Text(
        //             data.description,
        //             style: const TextStyle(
        //                 fontSize: 19, fontWeight: FontWeight.w700),
        //           ),
        //           subtitle: Text(
        //             data.time.timeZoneName,
        //             // '${data.time.year}-${data.time.day}-${data.time.month}',
        //             style: const TextStyle(fontWeight: FontWeight.w700),
        //           ),
        //           trailing: Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Text(
        //                 data.amount.toString(),
        //                 // style: TextStyle(
        //                 //   fontSize: 18,
        //                 //   fontWeight: FontWeight.w700,
        //                 //   color: data.amount == 'Income'
        //                 //       ? Colors.green[400]
        //                 //       : const Color.fromARGB(255, 202, 27, 15),
        //                 // ),
        //               ),
        //               const SizedBox(
        //                 width: 2,
        //               ),
        //               IconButton(
        //                 onPressed: () {
        //                   showDialog(
        //                     context: context,
        //                     builder: (BuildContext context) {
        //                       return AlertDialog(
        //                         title: const Text(
        //                           " Delete Data",
        //                           style: TextStyle(
        //                               color: Colors.black,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         content: const Text(
        //                           " You are going to delete this data",
        //                           style: TextStyle(color: Colors.black),
        //                         ),
        //                         actions: [
        //                           ElevatedButton(
        //                             style: ElevatedButton.styleFrom(
        //                                 backgroundColor: Colors.white),
        //                             onPressed: () {
        //                               Navigator.of(context).pop();
        //                             },
        //                             child: const Text(
        //                               "No",
        //                               style: TextStyle(color: Colors.black),
        //                             ),
        //                           ),
        //                           ElevatedButton(
        //                             style: ElevatedButton.styleFrom(
        //                                 backgroundColor: Colors.red),
        //                             onPressed: () {
        //                               // deleteData(index);
        //                               Navigator.of(context).pop();
        //                             },
        //                             child: const Text(
        //                               "Yes",
        //                               style: TextStyle(color: Colors.white),
        //                             ),
        //                           ),
        //                         ],
        //                       );
        //                     },
        //                   );
        //                 },
        //                 icon: const Icon(
        //                   Icons.delete_rounded,
        //                   color: Colors.red,
        //                 ),
        //               ),
        //               const SizedBox(width: 2),
        //             ],
        //           ),
        //         );
        //       },
        //       separatorBuilder: (ctx, index) {
        //         return const Divider();
        //       },
        //       itemCount: walletList.length,
        //     );
        //   },
        // ),
        );
  }
}
