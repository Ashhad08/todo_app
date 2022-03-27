import 'package:flutter/material.dart';
import 'profile.dart';
import 'home.dart';

class StaringOfWithBNB extends StatefulWidget {
  const StaringOfWithBNB({Key? key}) : super(key: key);

  @override
  State<StaringOfWithBNB> createState() => _StaringOfWithBNBState();
}

class _StaringOfWithBNBState extends State<StaringOfWithBNB> {
  List<Widget> screenList = [Home(), Profile()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 54,
        width: MediaQuery.of(context).size.width,
        child: BottomAppBar(
          clipBehavior: Clip.hardEdge,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xff3559C0),
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "",
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: "",
                tooltip: 'profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff3559C0),
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screenList.elementAt(_selectedIndex),
    );
  }
}
