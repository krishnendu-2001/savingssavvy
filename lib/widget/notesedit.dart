// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/db/model/money/money_model.dart';
// import 'package:flutter_application_1/db/model/note/note_model.dart';
// import 'package:flutter_application_1/functions/money_function.dart';
// import 'package:flutter_application_1/functions/note_function.dart';
// import 'package:flutter_application_1/widget/bottombar.dart';

// // ignore: camel_case_types
// class NotesEdit extends StatefulWidget {
//   final String title;
//   final String time;
//   final String text;
//   final int index;
//   const NotesEdit(
//       {Key? key,
//       required this.title,
//       required this.time,
//       required this.text,
//       required this.index})
//       : super(key: key);

//   @override
//   State<NotesEdit> createState() => _EditDataState();
// }

// class _EditDataState extends State<NotesEdit> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController textController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getAllnotes();
//     titleController = TextEditingController(text: widget.title);
//     textController = TextEditingController(text: widget.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 108, 120, 42),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 135, 150, 0),
//           title: const Text('Edit Expense'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: TextFormField(
//                           controller: titleController,
//                           style: const TextStyle(color: Colors.black),
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Edit your expense',
//                             hintStyle: TextStyle(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(children: [
//                     Container(
//                         height: 80,
//                         width: 320,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         )),
//                   ])),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: TextFormField(
//                           controller: textController,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           keyboardType: TextInputType.number,
//                           style: const TextStyle(color: Colors.black),
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Edit amount',
//                             hintStyle: TextStyle(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           update();
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                       ),
//                       child: const Text(
//                         "Done",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> update() async {
//     final String editedTitle = titleController.text.trim();
//     final String editedText = textController.text.trim();

//     if (editedTitle.isEmpty || editedText.isEmpty) {
//       return;
//     } else {
//       final updated = notemodel(
//         title: editedTitle,
//         time: DateTime.now(),
//         text: editedText,
//         datee: '',
//       );

//       edit(widget.index, updated);
//       Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => const BottomNavigation()));
//     }
//   }
// }
