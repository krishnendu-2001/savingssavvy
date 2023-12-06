// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widget/bottombar.dart';

// import 'package:google_fonts/google_fonts.dart';

// ValueNotifier showCategory = ValueNotifier('All');

// class TransactionList extends StatefulWidget {
//   TransactionList({
//     super.key,
//   });

//   @override
//   State<TransactionList> createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
//   @override
//   Widget build(BuildContext context) {
//     // final Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           actions: const [
//             SizedBox(
//               width: 20,
//             ),
//           ],
//           backgroundColor: Colors.black,
//           leading: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (context) => BottomNavigation()));
//               },
//               child: Icon(Icons.arrow_back_outlined)),
//           title: Center(
//               child: Text('Transaction History',
//                   style: GoogleFonts.ubuntu(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ))),
//         ),
//         body: Container(child: Column()),
//       ),
//     );
//   }
// }
