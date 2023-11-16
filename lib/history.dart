// import 'package:flutter/material.dart';

// class historyScreen extends StatelessWidget {
//   const historyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 255, 162, 22),
//           title: Text('Transaction History'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     width: 10,
//                   ),
//                   Container(
//                     height: 45,
//                     width: 460,
//                     child: TextFormField(
//                       textAlign: TextAlign.start,
//                       decoration: InputDecoration(
//                         fillColor: const Color.fromARGB(255, 218, 210, 210),
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         hintText: 'Search for products',
//                         prefixIcon: const Icon(Icons.search),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//                 width: 15,
//               ),
//               container1(text1: "Medicine", text2: "1-11-2023", text3: "₹500"),
//               SizedBox(height: 15),
//               container1(text1: "Food", text2: "1-11-2023", text3: "₹200"),
//               SizedBox(height: 15),
//               container1(text1: "Grocery", text2: "1-11-2023", text3: "₹1000"),
//               SizedBox(height: 15),
//               container1(text1: "Travel", text2: "2-11-2023", text3: "₹300"),
//               SizedBox(height: 15),
//               container1(
//                   text1: "Education", text2: "2-11-2023", text3: "₹7000"),
//               SizedBox(height: 15),
//               container1(text1: "Party", text2: "3-11-2023", text3: "₹2000"),
//               SizedBox(height: 15),
//               container1(text1: "Food", text2: "3-11-2023", text3: "₹250"),
//               SizedBox(height: 15),
//               container1(text1: "Travel", text2: "3-11-2023", text3: "₹500"),
//               SizedBox(height: 15),
//               container1(text1: "Food", text2: "4-11-2023", text3: "₹150"),
//               SizedBox(height: 15),
//               container1(text1: "Salary", text2: "5-11-2023", text3: "₹50000"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container container1({
//     required String text1,
//     required String text2,
//     required String text3,
//   }) {
//     return Container(
//       color: Color.fromARGB(255, 238, 236, 236),
//       height: 60,
//       width: 1000,
//       child: ListTile(
//         title: Text(text1),
//         subtitle: Text(text2),
//         trailing: Text(text3),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({super.key});

  @override
  State<historyScreen> createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("history"),
        ),
        body: ListView.builder(
          itemCount: 10, // Number of lists
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('List ${index + 1}'), // Adjust the text as needed
              // Add other properties/widgets as needed for each list item
            );
          },
        ));
  }
}
