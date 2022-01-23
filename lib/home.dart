import 'package:flutter/material.dart';

import 'components/card1.dart';
import 'components/card2.dart';
import 'components/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fooderlich",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card2",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card3",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
