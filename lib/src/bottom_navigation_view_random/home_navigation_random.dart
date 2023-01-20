import 'package:bottomview/src/bottom_navigation_view_random/fake_repo.dart';
import 'package:flutter/material.dart';

class MyHomePageRandom extends StatefulWidget {
  const MyHomePageRandom({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageRandom> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageRandom> {
  var repo = FakeRepo();
  int _selectedIndex = 0;
  List<Widget> _pages = [];
  List<BottomNavigationBarItem> _items = [];

  @override
  void initState() {
    super.initState();
    repo.getMenu((p0, p1) => {
          setState(() {
            _selectedIndex = 0;
            _items = p0;
            _pages = p1;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
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
        items: _items,
        currentIndex: _selectedIndex,
        //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
