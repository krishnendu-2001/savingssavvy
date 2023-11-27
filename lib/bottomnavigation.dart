import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/addPage.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/notes.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/transaction%20history/history_transaction.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _bottomNavIndex = 0;
  final _pages = const [
    homeScreen(),
    historyScreen(),
    noteScreen(),
    settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 162, 22),
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.black,
        icons: [
          Icons.home,
          Icons.history,
          Icons.note,
          Icons.settings,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        activeColor: Color.fromARGB(255, 255, 162, 22),
        inactiveColor: Colors.white,
      ),
    );
  }
}
