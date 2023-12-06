import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/addpage.dart';

import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/notes.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:flutter_application_1/screens/transaction%20history/history_transaction.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _bottomNavIndex = 0;
  final _pages = [
    HomeScreen(),
    TransactionHistory(), // Use HistoryScreen instead of HistoryScreenState
    NoteScreen(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => (_bottomNavIndex == 0 ||
                    _bottomNavIndex == 1 ||
                    _bottomNavIndex == 2)
                ? AddScreen()
                : NoteScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 109, 194, 185),
        icons: [
          Icons.home,
          Icons.history,
          Icons.note,
          Icons.settings,
        ],
        activeIndex: _bottomNavIndex,

        ///
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        activeColor: Colors.white,
        inactiveColor: Colors.white,
      ),
    );
  }
}
