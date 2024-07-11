import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class FormPage extends StatefulWidget {
  final ref = FirebaseDatabase.instance.ref("walkandwin");

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<Map<String, dynamic>> dataList = [];
  int _currentIndex = 1;
  bool showRedCircle1 = false;
  bool showRedCircle2 = false;
  bool showRedCircle3 = false;
  bool showRedCircle4 = false;


  double circleTop1 = 290;
  double circleTop2 = 450;
  double circleTop3 = 360;
  double circleTop4 = 365;


  double circleLeft1 = 10;
  double circleLeft2 = -55;
  double circleLeft3 = -55;
  double circleLeft4 = 10;

  double circleRight1 = -180;
  double circleRight2 = -180;
  double circleRight3 = -180;
  double circleRight4 = -190;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: FirebaseAnimatedList(
                query: widget.ref,
                itemBuilder: (context, snapshot, animation, index) {
                  String pression1 = snapshot.child("pression1").value.toString();
                  String pression2 = snapshot.child("pression2").value.toString();
                  String pression3 = snapshot.child("pression3").value.toString();
                  String pression4 = snapshot.child("pression4").value.toString();

                  dataList.add({
                    'pression1': pression1,
                    'pression2': pression2,
                    'pression3': pression3,
                    'pression4': pression4,
                  });

                  return SizedBox();
                  
                },
              ),
            ),
            Positioned(
              top: 200,
              left: -300,
              right: -100,
              child: Image.asset(
                'images/left1.png',
                height: 300,
                width: 100,
              ),
            ),
            Positioned(
              top: 200,
              left: 80,
              right: -110,
              child: Image.asset(
                'images/right1.png',
                height: 300,
                width: 100,
              ),
            ),
            if (showRedCircle1)
              Positioned(
                top: circleTop1,
                left: circleLeft1,
                right: circleRight1,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 219, 52, 40),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 209, 25, 12).withOpacity(0.3),
                        spreadRadius: 20,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            if (showRedCircle2)
              Positioned(
                top: circleTop2,
                left: circleLeft2,
                right: circleRight2,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 219, 52, 40),
                    boxShadow: [
                      BoxShadow(
                         color: Color.fromARGB(255, 209, 25, 12).withOpacity(0.3),
                        spreadRadius: 20,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              if (showRedCircle3)
              Positioned(
                top: circleTop3,
                left: circleLeft3,
                right: circleRight3,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                   color: Color.fromARGB(255, 219, 52, 40),
                    boxShadow: [
                      BoxShadow(
                         color: Color.fromARGB(255, 209, 25, 12).withOpacity(0.3),
                        spreadRadius: 20,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              if (showRedCircle4)
              Positioned(
                top: circleTop4,
                left: circleLeft4,
                right: circleRight4,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 219, 52, 40),
                    boxShadow: [
                      BoxShadow(
                         color: Color.fromARGB(255, 209, 25, 12).withOpacity(0.3),
                        spreadRadius: 20,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.ref.onChildChanged.listen((event) {
      int pression1 = int.tryParse(event.snapshot.child("pression1").value.toString()) ?? 0;
      int pression2 = int.tryParse(event.snapshot.child("pression2").value.toString()) ?? 0;
      int pression3 = int.tryParse(event.snapshot.child("pression3").value.toString()) ?? 0;
      int pression4 = int.tryParse(event.snapshot.child("pression4").value.toString()) ?? 0;
      setState(() {
        showRedCircle1 = pression1 >= 1;
        showRedCircle3 = pression2 >= 1;
        showRedCircle4 = pression3 >= 1;
        showRedCircle2 = pression4 >= 1;
      });
    });
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
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
      items: widget.items,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}