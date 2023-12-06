// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class SlidebleTransaction extends StatelessWidget {
//   const SlidebleTransaction({Key? key, required this.transaction})
//       : super(key: key);

//   final AddScreen;

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       endActionPane: ActionPane(motion: const StretchMotion(), children: [
//         SlidableAction(
//           onPressed: ((context) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: ((context) {
//                   // Simplified EditTransaction widget
//                   return Container(
//                     child: Text('Edit Transaction'),
//                   );
//                 }),
//               ),
//             );
//           }),
//           icon: Icons.edit,
//           foregroundColor: Colors.blue,
//         ),
//         SlidableAction(
//           onPressed: (_) {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('Delete Transaction'),
//                 content: const Text(
//                     'Are you sure you want to delete this transaction?'),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text(
//                       "Cancel",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       // Simplified delete logic
//                       // TransactionDB().deleteTransaction(transaction);
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       "Delete",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           icon: Icons.delete,
//           foregroundColor: Colors.red,
//         ),
//       ]),
//       child: Card(
//         color: Colors.white,
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: ListTile(
//           title: Text(
//             'Transaction Title',
//             style: const TextStyle(
//               fontSize: 17,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           subtitle: Text(
//             'Transaction Date',
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//           ),
//           trailing: Text(
//             '₹ Transaction Amount',
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 19,
//               color: Colors.green, // or Colors.red based on the condition
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
