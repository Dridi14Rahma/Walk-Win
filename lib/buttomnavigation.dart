import 'package:flutter/material.dart';


class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/details');
            },
            child:  Image.asset(
              'images/home.png',
              height:30,
              width: 30,
            ),
          ),
          label: 'Home',
        ),
       
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/AI');
            },
            child:    Image.asset(
              'images/robot.png',
              height: 30,
              width: 30,
            ),
          ),
          label: 'Allan',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/config');
            },
            child:  Image.asset(
              'images/settings.png',
              height: 30,
              width: 30,
            ),
          ),
          label: 'Config',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
