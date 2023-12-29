import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/selected_screen/selectedpage.dart';

import 'package:flutter_application_1/screens/home_screen/home.dart';
import 'package:flutter_application_1/screens/notes_screen/noteadd.dart';
import 'package:flutter_application_1/screens/notes_screen/notes.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:flutter_application_1/screens/transaction_screen/history_transaction.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _bottomNavIndex = 0;
  final _pages = [
    const HomeScreen(),
    const TransactionHistory(),
    const NoteScreen(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => (_bottomNavIndex == 0 ||
                    _bottomNavIndex == 1 ||
                    _bottomNavIndex == 3)
                ? const AddScreen()
                : const NotesAdd(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 109, 194, 185),
        icons: const [
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
