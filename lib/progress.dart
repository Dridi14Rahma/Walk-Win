import 'package:bottom_picker/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

class Formee extends StatefulWidget {
  Formee({Key? key}) : super(key: key);
  final ref = FirebaseDatabase.instance.ref("walkandwin");

  @override
  _FormeeState createState() => _FormeeState();
}

class _FormeeState extends State<Formee> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("walkandwin");
  int id = 0;
  List<Map<String, dynamic>> dataList = [];
  String? selectedGoal;

  List<QueryDocumentSnapshot> data = [];

  bool showRedCircle1 = false;
  bool showRedCircle2 = false;
  bool showRedCircle3 = false;
  bool showRedCircle4 = false;

  double circleTop1 = 100;
  double circleTop2 = 155;
  double circleTop3 = 155;
  double circleTop4 = 200;

  double circleLeft1 = 5;
  double circleLeft2 = -55;
  double circleLeft3 = -55;
  double circleLeft4 = -48;

  double circleRight1 = -100;
  double circleRight2 = -150;
  double circleRight3 = -190;
  double circleRight4 = -130;

  void getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('client')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber)
        .get();
    setState(() {
      data = querySnapshot.docs;
      if (data.isNotEmpty) {
        selectedGoal = data[0]['goal'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
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
            top: 40,
            left: -128,
            right: -100,
            child: Image.asset(
              'images/footprints.png',
              height: 220,
              width: 500,
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
                width: 15,
                height: 15,
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
                width: 15,
                height: 15,
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
          Positioned(
            top: 120,
            right: 170,
            child: SizedBox(
              height: 400,
              width: 400,
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  int? steps = snapshot.child("Steps").value as int?;
                  // Comparer les valeurs de Steps et Goal
                


                  return ListTile(
                    subtitle: Text(
                      steps.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 20, 128, 229),
                        fontSize: 16
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            
            child: Text(
              'Goal : $selectedGoal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 88, 61, 238)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();

    widget.ref.onChildChanged.listen((event) {
      int pression1 = int.tryParse(event.snapshot.child("pression1").value.toString()) ?? 0;
      int pression2 = int.tryParse(event.snapshot.child("pression2").value.toString()) ?? 0;
      int pression3 = int.tryParse(event.snapshot.child("pression3").value.toString()) ?? 0;
      int pression4 = int.tryParse(event.snapshot.child("pression4").value.toString()) ?? 0;
      setState(() {
        showRedCircle1 = pression1 >= 1;
        showRedCircle2 = pression2 >= 1;
        showRedCircle3 = pression3 >= 1;
        showRedCircle4 = pression4 >= 1;
      });
    });
  }
}
