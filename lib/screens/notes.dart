import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key, String? myNamedParameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Notes',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(width: 20), // Add spacing between 'Notes' and TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'search notes...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Expanded(
                  child: ListView(
                children: [
                  Container(
                    color: Colors.red,
                    child: ListTile(
                      title: RichText(
                          text: TextSpan(
                        text: 'like and subs',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            height: 1.5),
                      )),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: Text(
                          'edited23423',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: NoteScreen(),
//   ));
// }



//
//
//
//
//
//
        // body: Column(
        //   children: [
        //     Row(
        //       children: [
        //         Expanded(
        //             child: ListView(
        //           children: [
        //             ListTile(
        //               title: RichText(
        //                   text: TextSpan(
        //                       text: 'dsadsa',
        //                       style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 18,
        //                         height: 1.5,
        //                       ),
        //                       children: [
        //                     TextSpan(
        //                         text: 'asfasfsf',
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontWeight: FontWeight.normal,
        //                             fontSize: 14,
        //                             height: 1.5))
        //                   ])),
        //             )
        //           ],
        //         ))
        //       ],
        //     )
        //   ],
        // ),

//
//
//
//
//
//
        // body: GridView.count(
        //   crossAxisCount: 2,
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         color: Colors.amber,
        //         child: Text(''),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(
        //         8.0,
        //       ),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         color: Colors.amber,
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         color: Colors.amber,
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         color: Colors.amber,
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         color: Colors.amber,
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         color: Colors.amber,
        //       ),
        //     )
        //   ],
        // ),
//       ),
//     );
//   }
// }
