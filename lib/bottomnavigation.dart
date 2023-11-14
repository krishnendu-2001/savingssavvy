import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/addPage.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/noteScreen.dart';
import 'package:flutter_application_1/settings.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _bottomNavIndex = 0; // Track the selected index

  final _pages = const [
    homeScreen(),
    historyScreen(),
    noteScreen(),
    settingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex], // Show the selected screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 162, 22),
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addScreen(),
          ));
        },
        child: const Icon(Icons.add),
        // Add other parameters as needed
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
          // Handle the onTap event for the bottom navigation bar
          setState(() {
            _bottomNavIndex = index;
          });
        },
        activeColor: Color.fromARGB(255, 255, 162, 22),
        inactiveColor: Colors.white,
        // Add other parameters as needed
      ),
    );
  }
}


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: PageView(
//       controller: _pageController,
//       physics: const NeverScrollableScrollPhysics(),
//       children: List.generate(
//           bottomBarPages.length, (index) => bottomBarPages[index]),
//     ),
//     extendBody: true,
//     bottomNavigationBar: (bottomBarPages.length <= maxCount)
//         ? AnimatedNotchBottomBar(
//             /// Provide NotchBottomBarController
//             notchBottomBarController: _controller,
//             color: Colors.white,
//             showLabel: false,
//             notchColor: Colors.black87,

//             /// restart app if you change removeMargins
//             removeMargins: false,
//             bottomBarWidth: 500,
//             durationInMilliSeconds: 300,
//             bottomBarItems: [
//               const BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.home_filled,
//                   color: Colors.blueGrey,
//                 ),
//                 activeItem: Icon(
//                   Icons.home_filled,
//                   color: Colors.blueAccent,
//                 ),
//                 itemLabel: 'Page 1',
//               ),
//               const BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.star,
//                   color: Colors.blueGrey,
//                 ),
//                 activeItem: Icon(
//                   Icons.star,
//                   color: Colors.blueAccent,
//                 ),
//                 itemLabel: 'Page 2',
//               ),
//               const BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.star,
//                   color: Colors.blueGrey,
//                 ),
//                 activeItem: Icon(
//                   Icons.plus_one,
//                   color: Colors.blueAccent,
//                 ),
//                 itemLabel: 'Page 2',
//               ),
//               const BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.settings,
//                   color: Colors.blueGrey,
//                 ),
//                 activeItem: Icon(
//                   Icons.settings,
//                   color: Colors.pink,
//                 ),
//                 itemLabel: 'Page 4',
//               ),
//               const BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.person,
//                   color: Colors.blueGrey,
//                 ),
//                 activeItem: Icon(
//                   Icons.person,
//                   color: Colors.yellow,
//                 ),
//                 itemLabel: 'Page 5',
//               ),
//             ],
//             onTap: (index) {
//               /// perform action on tab change and to update pages you can update pages without pages
//               log('current selected index $index');
//               _pageController.jumpToPage(index);
//             },
//           )
//         : null,
//    );
// }
