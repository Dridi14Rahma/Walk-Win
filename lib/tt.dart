import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_project1/details.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _controllerweight = TextEditingController();
  TextEditingController _controllerheight = TextEditingController();
  TextEditingController _controllergoal = TextEditingController();
  TextEditingController _controllergender = TextEditingController();

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  String? selectedWeight;
  String? selectedHeight;
  String? selectedGoal;
  String? selectedGender;

void _openGenderPicker(BuildContext context) {
  BottomPicker(
    items: [
      Text('Male'),
      Text('Female')
    ], // Options de genre
    title: 'Select Gender',
    pickerTextStyle: const TextStyle(
      color: Colors.blue,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    onSubmit: (index) {
      setState(() {
        selectedGender = ['Male', 'Female'][index];
      });
    },
  ).show(context);
}



  void _openWeightPicker(BuildContext context) {
    BottomPicker(
      items: List.generate(266, (index) => Text('${index + 35} kg')),
      title: 'Select Weight',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedWeight = '${index + 35} kg';
          _controllerweight.text = selectedWeight ?? '';
        });
      },
    ).show(context);
  }

  void _openHeightPicker(BuildContext context) {
    BottomPicker(
      items: List.generate(211, (index) => Text('${index + 30} cm')),
      title: 'Select Height',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedHeight = '${index + 30} cm';
          _controllerheight.text = selectedHeight ?? '';
        });
      },
    ).show(context);
  }

  void _openGoalsPicker(BuildContext context) {
    BottomPicker(
      items: List.generate(9, (index) => Text('${index * 500 + 6000}')),
      title: 'Select Goals',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedGoal = '${index * 500 + 6000}';
          _controllergoal.text = selectedGoal ?? '';
        });
      },
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your gender',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _openGenderPicker(context);
              },
              icon: Icon(Icons.person),
              label: Text(selectedGender ?? "Select Gender"),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                _openWeightPicker(context);
              },
              icon: Icon(Icons.monitor_weight),
              label: Text(selectedWeight ?? "Select Weight"),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                _openHeightPicker(context);
              },
              icon: Icon(Icons.height),
              label: Text(selectedHeight ?? "Select Height"),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                _openGoalsPicker(context);
              },
              icon: Icon(Icons.flag),
              label: Text(selectedGoal ?? "Select Goals"),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            color: const Color.fromARGB(255, 47, 137, 205),
            textColor: Colors.white,
            minWidth: 100,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsPage()),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Next"),
                SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(width: 20), // Ajout d'un espace

          // Bouton pour ajouter l'utilisateur à Firestore
          FloatingActionButton(
            onPressed: addUser,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  CollectionReference client = FirebaseFirestore.instance.collection('client');

  Future<void> addUser() {
    // Ajout de l'utilisateur dans Firestore
    return client
        .add({
          'weight': _controllerweight.text, // Poids de l'utilisateur
          'height': _controllerheight.text, // Taille de l'utilisateur
          'goal': _controllergoal.text, // Objectif de l'utilisateur
          'gender': selectedGender ?? '' , // Genre de l'utilisateur
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
