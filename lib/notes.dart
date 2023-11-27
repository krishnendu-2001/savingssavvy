import 'package:flutter/material.dart';
import 'package:flutter_application_1/notes/page1.dart';

class noteScreen extends StatelessWidget {
  const noteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
          backgroundColor: Color.fromARGB(
              255, 255, 162, 22), // Set the background color to yellow
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
            // Add an e
            //mpty container to push the FAB to the right

            // Your FAB goes here
            // FloatingActionButton(
            //   shape: CircleBorder(eccentricity: BorderSide.strokeAlignCenter),
            //   backgroundColor: Color.fromARGB(255, 92, 172, 162),
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => notePage1(),
            //     ));
            //   },
            //   child: Icon(Icons.add),
            // ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Make'), Text('Notes')],
          ),
        ),
      ),
    );
  }
}
