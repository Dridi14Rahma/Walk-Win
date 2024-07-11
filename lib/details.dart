import 'package:lottie/lottie.dart';

import 'date.dart';
import 'graphee.dart';
import 'progress.dart';
import 'information.dart';
import 'package:flutter/material.dart';
import 'buttomnavigation.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];

    DateTime date = DateTime.now().subtract(const Duration(days: 3));

    for (int i = 0; i < 6; i++) {
      dateBoxes.add(DateBox(date: date, active: i == 3));
      date = date.add(const Duration(days: 1));
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50,
              child: Lottie.network(
                "https://lottie.host/db2b9b9c-0fdd-47d5-9e33-1853f91cb1e8/3WYc2mJdvs.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
                wordSpacing: 5.0,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/baccccckk.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: dateBoxes,
                ),
              ),
            ),
            Expanded(
              child: Formee(), // Wrap your formee widget with Expanded
            ),
            const SizedBox(height: 20),
            const Graph(), // Ajoutez le widget Graph ici
            const SizedBox(height: 28),
            const Inf(),
            const SizedBox(height: 28),
            MyBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
