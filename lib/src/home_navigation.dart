import 'package:bottomview/src/subPages/dashboard.dart';
import 'package:bottomview/src/subPages/emails.dart';
import 'package:bottomview/src/subPages/home.dart';
import 'package:bottomview/src/subPages/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0; //New
  late AnimationController animationController;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _pages = <Widget>[
      ScreenEmails(
        inScrollDown: (bool) {
          bool ? animationController.forward() : animationController.reverse();
        },
      ),
      const ScreenHome(),
      const ScreenDashboard(),
      const ScreenProfile(),

    ];
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizeTransition( // Remove Size Transition fon only BottomNavigationBar
        sizeFactor: animationController,
        axisAlignment: -1.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          mouseCursor: SystemMouseCursors.grab,
          elevation: 15,
          iconSize: 25,
          selectedFontSize: 20,
          selectedIconTheme:
              const IconThemeData(color: Colors.amberAccent, size: 25),
          selectedItemColor: Colors.amberAccent,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedIconTheme: const IconThemeData(
            color: Colors.deepOrangeAccent,
          ),
          unselectedItemColor: Colors.deepOrangeAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "test",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "test",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "test",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "test",
            ),
          ],
          currentIndex: _selectedIndex,
          //New
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
