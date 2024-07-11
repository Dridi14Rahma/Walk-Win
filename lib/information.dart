import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:lottie/lottie.dart';

class Inf extends StatefulWidget {
  const Inf({Key? key}) : super(key: key);

  @override
  _InfState createState() => _InfState();
}

class _InfState extends State<Inf> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("walkandwin");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        
       Container(
  width: 150,
  height: 80,
  decoration: BoxDecoration(
    border: Border.all(
      color:Color.fromARGB(255, 35, 13, 236),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
    color: Colors.grey[200],
  ),
  child: Stack(
    children: [
       Positioned(
        bottom: 47,
        left: 4, // Ajustez cette valeur pour positionner le texte horizontalement
        child: Text(
          'Distance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      FirebaseAnimatedList(
  query: ref,
  itemBuilder: (context, snapshot, animation, index) {
    String distance = snapshot.child("Distance").value.toString();

    return ListTile(
      subtitle: Text(
        '$distance km',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 4, 221),
        ),
      ),
    );
  },
),

      Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 50,
          width: 60,
          child:  Image.asset(
              'images/distance.png',
              height: 220,
              width: 500,
            ),
        ),
      ),
    ],
  ),
),


      Container(
  width: 150,
  height: 80,
  decoration: BoxDecoration(
    border: Border.all(
      color: Color.fromARGB(255, 35, 13, 236),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
    color: Colors.grey[200],
  ),
  child: Stack(
    children: [
      FirebaseAnimatedList(
  query: ref,
  itemBuilder: (context, snapshot, animation, index) {
    String hours = snapshot.child("Hours").value.toString();
    String minutes = snapshot.child("Minutes").value.toString();

    return ListTile(
      subtitle: Text(
        '$hours : $minutes   min',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 4, 221),
        ),
      ),
    );
  },
),

      Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 50,
          width: 60,
          child:  Image.asset(
              'images/hourglass.png',
              height: 220,
              width: 500,
            ),
        ),
      ),
      Positioned(
        bottom: 47,
        left: 4, // Ajustez cette valeur pour positionner le texte horizontalement
        child: Text(
          'Time Action',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  ),
),


      ],
    );
  }
}

class Stats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;
  final IconData icon;
  final Widget? firebaseList;

  const Stats({
    Key? key,
    required this.value,
    required this.unit,
    required this.label,
    required this.icon,
    this.firebaseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
              child: Icon(icon),
            ),
            const SizedBox(width: 8),
            Text.rich(
              TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: unit,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (firebaseList != null) firebaseList!,
      ],
    );
  }
}
