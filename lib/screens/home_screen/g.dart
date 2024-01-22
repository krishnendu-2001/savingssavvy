// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/functions/money_function.dart';
// import 'package:flutter_application_1/db/model/money/money_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   List<moneymodel> moneyList = moneyListNotifier.value;
//   late TabController _tabcontroller;

//   double totalIncome = 0.0;
//   double totalExpense = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _tabcontroller = TabController(length: 3, vsync: this);
//     _calculateTotals();
//   }

//   void _calculateTotals() {
//     for (var transaction in moneyList) {
//       if (transaction.type == 'income') {
//         totalIncome += double.parse(transaction.amount);
//       } else if (transaction.type == 'expense') {
//         totalExpense += double.parse(transaction.amount);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.purple[50],
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               // const ListTile(
//               //   title: Text(
//               //     'Hey! Krishnendu',
//               //     style: TextStyle(fontWeight: FontWeight.bold),
//               //   ),
//               // ),
//               const SizedBox(height: 0),

//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: SizedBox(
//                   height: 300,
//                   child: Stack(
//                     children: [
//                       PieChart(
//                         swapAnimationDuration: const Duration(milliseconds: 0),
//                         swapAnimationCurve: Curves.bounceIn,
//                         PieChartData(
//                           sections: [
//                             PieChartSectionData(
//                               value: totalIncome,
//                               title: "Income",
//                               color: const Color(0xFF5E35B1),
//                             ),
//                             PieChartSectionData(
//                               value: totalExpense,
//                               title: "Expenses",
//                               color: Colors.deepPurple[50],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Total Income: ${totalIncome.toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 18, color: Colors.green[400]),
//               ),
//               Text(
//                 'Total Expense: ${totalExpense.toStringAsFixed(2)}',
//                 style: const TextStyle(
//                     fontSize: 18, color: Color.fromRGBO(202, 15, 15, 1)),
//               ),
//               Container(
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: TabBar(
//                       controller: _tabcontroller,
//                       labelPadding: const EdgeInsets.only(left: 0, right: 0),
//                       labelColor: Colors.white,
//                       unselectedLabelColor: Colors.black,
//                       tabs: const [
//                         Tab(
//                           text: 'Explore',
//                         ),
//                         Tab(
//                           text: 'Total Balance',
//                         ),
//                         Tab(
//                           text: 'Chart',
//                         )
//                       ]),
//                 ),
//               ),
//               SizedBox(
//                   width: double.maxFinite,
//                   height: 300,
//                   child: TabBarView(
//                     controller: _tabcontroller,
                    
//                     children: [
//                       ListView.builder(itemBuilder: (_, index) {
//                         return Container(
//                           height: 300,
//                           width: 200,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: const DecorationImage(
//                                   image: AssetImage(
//                                      image.asset "images/1b99a864-deaf-4480-a6c5-9baaa042c4d3.jpeg "))),
//                         );
//                       }),
//                                             ListView.builder(itemBuilder: (_, index) {
//                         return Container(
//                           height: 300,
//                           width: 200,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: const DecorationImage(
//                                   image: AssetImage(
//                                      image.asset "images/1b99a864-deaf-4480-a6c5-9baaa042c4d3.jpeg "))),
//                         );
//                       }),                      ListView.builder(itemBuilder: (_, index) {
//                         return Container(
//                           height: 300,
//                           width: 200,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: const DecorationImage(
//                                   image: AssetImage(
//                                      image.asset "images/1b99a864-deaf-4480-a6c5-9baaa042c4d3.jpeg "))),
//                         );
//                       })
//                     ],
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),

//               const Text('Recent',
//                   style: TextStyle(color: Colors.black, fontSize: 20)),
//               const Divider(),
//               SizedBox(
//                 height: 300,
//                 width: 500,
//                 child: ValueListenableBuilder(
//                   valueListenable: moneyListNotifier,
//                   builder: (BuildContext ctx, List<moneymodel> moneyList,
//                       Widget? child) {
//                     return ListView.builder(
//                       itemCount: moneyList.length > 5 ? 5 : moneyList.length,
//                       itemBuilder: (BuildContext ctx, int index) {
//                         final data = moneyList[index];
//                         return ListTile(
//                           title: Text(data.description,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text(
//                             '${data.time.year}-${data.time.day}-${data.time.month}',
//                             style: const TextStyle(fontWeight: FontWeight.w700),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 data.amount,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                   color: data.type == 'income'
//                                       ? Colors.green[400]
//                                       : const Color.fromRGBO(202, 15, 15, 1),
//                                 ),
//                               ),
//                               const SizedBox(width: 2),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container recent({
//     required String textA,
//     required String textB,
//     required String textC,
//   }) {
//     return Container(
//         height: 60,
//         width: 500,
//         color: const Color.fromARGB(255, 245, 241, 241),
//         child: ListTile(
//           title: Text(textA),
//           subtitle: Text(textB),
//           trailing: Text(textC),
//         ));
//   }
// }
